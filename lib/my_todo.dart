import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'drawer.dart';
import 'theme.dart';
import 'component.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final mytodo = Hive.box('todo');
  List<Map<String, dynamic>> _list = [];

  final TextEditingController _contentController =
      TextEditingController(text: "");
  bool isDone = false;
  bool length = false;

  @override
  void initState() {
    super.initState();
    _refreshLists(); // Load data when app starts
  }

  // Get all items from the database
  // MARK: REFRESH
  void _refreshLists() {
    final data = mytodo.keys.map((key) {
      final value = mytodo.get(key);
      return {
        "key": key,
        "content": value['content'],
        "isDone": value['isDone'],
      };
    }).toList();
    setState(() {
      _list = data.reversed.toList();
    });
  }

  // create a card and add data to wishlist and refresh cards.
  Future<void> _createList(Map<String, dynamic> itemList) async {
    await mytodo.add(itemList);
    _refreshLists();
  }

  // update a card and add data to wishlist and refresh cards.
  Future<void> _updateList(int keyList, Map<String, dynamic> itemList) async {
    await mytodo.put(keyList, itemList);
    _refreshLists();
  }

  // Delete a single card and remove form wishlist.
  Future<void> _deleteList(int keyList) async {
    await mytodo.delete(keyList);
    _refreshLists();

    // Display a snackbar
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An item has been deleted')));
  }

  // MARK: BOTTOM SHEET
  // It is a form which take input from user and send to create or update data.
  Future<void> _bottomSheet(int? keyList) async {
    if (keyList != null) {
      final existCard =
          _list.firstWhere((element) => element['key'] == keyList);
      _contentController.text = existCard['content'];
      isDone = existCard['isDone'];
    }
    showModalBottomSheet(
      context: context,
      backgroundColor: white,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) => Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).viewInsets.left + 10,
                top: MediaQuery.of(context).viewInsets.top + 10,
                right: MediaQuery.of(context).viewInsets.right + 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // WRITE YOUR CONTENT.
                TextField(
                  onChanged: (value) {
                    setState(() {
                      length = value.length > 3;
                    });
                  },
                  controller: _contentController,
                  maxLines: 5,
                  cursorColor: darkGreen,
                  style: GoogleFonts.quicksand(
                    color: darkGreen,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: green.withOpacity(0.2),
                    hintText: "Write your task",
                    hintStyle: GoogleFonts.quicksand(
                      color: darkGreen.withOpacity(0.3),
                      fontWeight: FontWeight.bold,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // CONFORMATION BUTTON
                ElevatedButton(
                  onPressed: length
                      ? () async {
                          if (keyList == null) {
                            _createList({
                              "content": _contentController.text,
                              "isDone": false,
                            });
                          }

                          if (keyList != null) {
                            _updateList(keyList, {
                              "content": _contentController.text,
                              "isDone": isDone,
                            });
                          }

                          _contentController.text = "";
                          Navigator.pop(context);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    keyList != null ? "Update" : "Add",
                    style: TextStyle(
                      fontFamily: 'Maven',
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // MARK: BUILD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CDrawer(),
      appBar: buildAppBar("Todo", green, darkGreen),
      body: ListView.builder(
        itemCount: _list.length,
        padding:
            const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 80),
        itemBuilder: (context, index) {
          final currentList = _list[index];

          return Row(
            children: [
              // CHECKBOX
              GestureDetector(
                onTap: () {
                  currentList['isDone'] = !currentList['isDone'];
                  mytodo.put(currentList['key'], currentList);
                  _refreshLists();
                },
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentList['isDone'] ? green : white,
                    border: Border.all(
                        width: 3,
                        color: green.withOpacity(0.5),
                        strokeAlign: BorderSide.strokeAlignOutside),
                  ),
                ),
              ),
              const SizedBox(width: 15),

              // CONTENT
              Expanded(
                child: GestureDetector(
                  onTap: () => _bottomSheet(currentList['key']),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: CTitle(
                            text: currentList['content'],
                            color: darkGreen,
                            size: 18,
                            decoration: currentList['isDone'],
                          ),
                        ),
                        IconButton(
                          onPressed: () => _deleteList(currentList['key']),
                          icon: Icon(Icons.delete_outline_rounded,
                              color: darkGreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _bottomSheet(null),
        backgroundColor: darkGreen,
        child: Icon(Icons.add_outlined, color: white),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'theme.dart';
import 'component.dart';

class Wishes extends StatefulWidget {
  const Wishes({super.key});

  @override
  State<Wishes> createState() => _WishesState();
}

class _WishesState extends State<Wishes> {
  // wishlist folder in android where all data will be store.
  final mywish = Hive.box('wishlist');
  // List of a map which read data from wishlist and display.
  List<Map<String, dynamic>> _card = [];

  final TextEditingController _titleController =
      TextEditingController(text: "");
  int percent = 0;
  bool length = false;

  @override
  void initState() {
    super.initState();
    _refreshCards(); // Load data when app starts
  }

  // Get all items from the database
  // MARK: REFRESH
  void _refreshCards() {
    final data = mywish.keys.map((key) {
      final value = mywish.get(key);
      return {
        "key": key,
        "title": value['title'],
        "percent": value['percent'],
      };
    }).toList();
    setState(() {
      _card = data.reversed.toList();
    });
  }

  // create a card and add data to wishlist and refresh cards.
  Future<void> _createCard(Map<String, dynamic> itemCard) async {
    await mywish.add(itemCard);
    _refreshCards();
  }

  // update a card and add data to wishlist and refresh cards.
  Future<void> _updateCard(int keyCard, Map<String, dynamic> itemCard) async {
    await mywish.put(keyCard, itemCard);
    _refreshCards();
  }

  // Delete a single card and remove form wishlist.
  Future<void> _deleteCard(int keyCard) async {
    await mywish.delete(keyCard);
    _refreshCards();

    // Display a snackbar
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('A card has been deleted')));
  }

  moreText(String text) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Maven', color: darkBlue, fontWeight: FontWeight.bold),
    );
  }

  more(int keyCard) {
    return PopupMenuButton(
      onSelected: (value) =>
          (value == 0) ? _bottomSheet(keyCard) : _deleteCard(keyCard),
      color: white,
      iconColor: blue,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
          child: moreText("Update"),
        ),
        PopupMenuItem(
          value: 1,
          child: moreText("Delete"),
        ),
      ],
    );
  }

  // MARK: BOTTOM SHEET
  // It is a form which take input from user and send to create or update data.
  Future<void> _bottomSheet(int? keyCard) async {
    if (keyCard != null) {
      final existCard =
          _card.firstWhere((element) => element['key'] == keyCard);
      _titleController.text = existCard['title'];
      percent = existCard['percent'];
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
                  controller: _titleController,
                  maxLines: 5,
                  cursorColor: darkBlue,
                  style: GoogleFonts.quicksand(
                    color: darkGreen,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: blue.withOpacity(0.2),
                    hintText: "Make a wish",
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
                          if (keyCard == null) {
                            _createCard({
                              "title": _titleController.text.toUpperCase(),
                              "percent": 0,
                            });
                          }

                          if (keyCard != null) {
                            _updateCard(keyCard, {
                              "title": _titleController.text.toUpperCase(),
                              "percent": percent,
                            });
                          }

                          _titleController.text = "";
                          Navigator.pop(context);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    keyCard != null ? "Update" : "Add",
                    style: TextStyle(
                      fontFamily: 'Maven',
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Title
                const Maven(text: "Active wishes"),

                // button to create new card.
                CIcon(
                  image: 'assets/icons/circle_plus.svg',
                  color: grey,
                  onPressed: () => _bottomSheet(null),
                ),
              ],
            ),
          ),
          SizedBox(
            height: _card.length * 170,
            child: ListView.builder(
              itemCount: _card.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final currentCard = _card[index];

                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  height: 160,
                  decoration: BoxDecoration(
                    color: darkBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Quicksand(
                              text: currentCard['title'],
                            ),
                          ),
                          // button for update or delete card.
                          more(currentCard['key']),
                        ],
                      ),
                      LinearPercentIndicator(
                        padding: const EdgeInsets.only(right: 10),
                        percent: currentCard['percent'] * 0.1,
                        backgroundColor: Colors.white.withOpacity(0.1),
                        progressColor: blue,
                        barRadius: const Radius.circular(5),
                        trailing: Maven(
                          text: "${currentCard['percent']} %",
                          color: blue,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

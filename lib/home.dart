import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'component.dart';
import 'theme.dart';

import 'my_todo.dart';
import 'my_wishes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _route = [const Wishes(), const Todo()];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: my[selected].backgroundColor,
        surfaceTintColor: my[selected].backgroundColor,
        leading: Builder(
          builder: (context) => CIcon(
            onPressed: () => Scaffold.of(context).openDrawer(),
            image: 'assets/icons/menu.svg',
            color: my[selected].color,
          ),
        ),
        centerTitle: true,
        title: Wrap(
          children: [
            Maven(text: "my", color: my[selected].color),
            Maven(text: my[selected].appTitle, color: white),
          ],
        ),
        actions: [
          CIcon(
            onPressed: () {},
            image: 'assets/icons/search.svg',
            color: my[selected].color,
          )
        ],
      ),
      body: _route[selected],
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: white,
          width: size.width * 0.85,
          child: Column(
            children: [
              // MARK: SETTING
              Align(
                alignment: Alignment.centerRight,
                child: CIcon(
                    image: 'assets/icons/setting.svg',
                    size: 35,
                    color: my[selected].color,
                    onPressed: () {}),
              ),
              const SizedBox(height: 10),

              // MARK: SCREENS
              SizedBox(
                height: size.height - 85,
                child: ListView.builder(
                  itemCount: my.length,
                  padding: const EdgeInsets.all(5),
                  itemBuilder: (context, index) => ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selected = index;
                      });
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: (selected == index)
                            ? my[selected].backgroundColor.withOpacity(0.1)
                            : white,
                        foregroundColor: (selected == index)
                            ? my[selected].backgroundColor
                            : grey,
                        surfaceTintColor: (selected == index)
                            ? my[selected].backgroundColor
                            : grey,
                        shadowColor: Colors.transparent,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 12.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          my[index].icon,
                          colorFilter: ColorFilter.mode(
                              (selected == index) ? my[selected].color : grey,
                              BlendMode.srcIn),
                          width: 30,
                        ),
                        const SizedBox(width: 10),
                        Maven(
                            text: "my${my[index].appTitle}",
                            color: black,
                            size: 18),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

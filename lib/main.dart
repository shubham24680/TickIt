import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cool Pages',
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: MyHomePage(),
          backgroundColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      pages(
        'assets/images/forbidden.png',
        "Horizon II: Forbidden West",
        "Guerrilla Games",
        "9.2/10",
        "Horizon Forbidden West is a 2022 action role-playing game developed by Guerrilla Games"
            " and published by Sony Interactive Entertainment. The sequel to 2017's Horizon Zero Dawn, "
            "the game is set in a post-apocalyptic version of the Western United States recovering from the "
            "aftermath of an extinction event caused by a rogue robot swarm. The player can explore the open world "
            "and complete quests using ranged and melee weapons against hostile machine creatures.",
      ),
      pages(
        'assets/images/forza5.jpg',
        "Froza Horizon 5",
        "Playground Games",
        "9/10",
        "Forza Horizon 5 is a 2021 racing video game developed by Playground Games and published by Xbox Game Studios."
            " It is the fifth Forza Horizon title and twelfth main instalment in the Forza series. The game is set in a fictionalised representation of Mexico.",
      ),
      pages(
          'assets/images/us2.jpg',
          "The Last Of Us Part II",
          "Naughty Dog",
          "8/10",
          "The Last of Us Part II is a 2020 action-adventure game developed by Naughty Dog and published by Sony Interactive Entertainment for the PlayStation 4."),
      pages(
        'assets/images/GOW.jpg',
        "God Of War",
        "Santa Monica",
        "10/10",
        "God of War is an action-adventure game franchise created by David Jaffe at Sony's Santa Monica Studio."
            "It began in 2005 on the PlayStation 2 video game console, and has become a flagship title for the PlayStation brand, "
            "consisting of ten games across multiple platforms with an eleventh currently in development.",
      ),
      pages(
        'assets/images/RE2.png',
        "Resident Evil 2",
        "Capcom",
        "9.1/10",
        "Resident Evil 2[a] is a 2019 survival horror game developed and published by Capcom."
            " A remake of the 1998 game Resident Evil 2, it was released for PlayStation 4, Windows, and Xbox One in January 2019 and for Amazon Luna,"
            " PlayStation 5 and Xbox Series X/S in June 2022, with a Nintendo Switch cloud version to be released in 2022. Players control rookie police officer"
            " Leon S. Kennedy and college student Claire Redfield as they attempt to escape Raccoon City during a viral outbreak that transforms the citizens"
            " into zombies and other creatures.",
      ),
    ]);
  }
}

pages(images, title, subTitle, rating, body) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(images),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    write(title, FontWeight.bold, Colors.black, 'Maven', 14.0),
                    write(
                        subTitle, FontWeight.normal, Colors.grey, 'Maven', 14.0)
                  ],
                ),
              ),
              Row(
                children: [
                  const Tap(),
                  write(rating, FontWeight.normal, Colors.black, 'Maven', 14.0),
                ],
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            make(Icons.call, 'CALL'),
            make(Icons.navigation, 'ROUTE'),
            make(Icons.share, 'SHARE'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40.0),
          child: write(body, FontWeight.bold, Colors.black, 'Jose', 16.0),
        )
      ],
    ),
  );
}

write(text, weight, color, family, size) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      fontFamily: family,
      fontWeight: weight,
      color: color,
    ),
  );
}

make(icon, text) {
  return Column(
    children: [
      Icon(
        icon,
        color: Colors.lightBlue,
      ),
      write(text, FontWeight.normal, Colors.lightBlue, 'Maven', 14.0),
    ],
  );
}

class Tap extends StatefulWidget {
  const Tap({super.key});

  @override
  State<Tap> createState() => _TapState();
}

class _TapState extends State<Tap> {
  static bool _active = false;
  void _change() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _change,
      icon: Icon(
        _active ? Icons.star_rounded : Icons.star_border_rounded,
        color: Colors.redAccent,
      ),
    );
  }
}

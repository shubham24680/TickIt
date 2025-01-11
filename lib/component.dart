import 'package:cool_pages/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// MARK: DETAIL
class Details {
  Details({
    required this.appTitle,
    required this.backgroundColor,
    required this.color,
    required this.icon,
  });

  late final String appTitle;
  late final Color backgroundColor;
  late final Color color;
  late final String icon;
}

List<Details> my = [
  Details(appTitle: "Wishes", backgroundColor: blue, color: darkBlue, icon: 'assets/icons/wishes.svg'),
  Details(appTitle: "Todo", backgroundColor: green, color: darkGreen, icon: 'assets/icons/todo.svg'),
];

// MARK: ICON
class CIcon extends StatelessWidget {
  const CIcon(
      {super.key,
      required this.image,
      required this.onPressed,
      this.color,
      this.size});

  final String image;
  final Function() onPressed;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        image,
        colorFilter: ColorFilter.mode(color ?? darkBlue, BlendMode.srcIn),
        height: size ?? 24,
      ),
    );
  }
}

// MARK: HEADING
class Maven extends StatelessWidget {
  const Maven({super.key, required this.text, this.color, this.size});

  final String text;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Maven',
        fontWeight: FontWeight.bold,
        color: color ?? darkBlue,
        fontSize: size ?? 20,
      ),
    );
  }
}

// MARK: TITLE
class Quicksand extends StatelessWidget {
  const Quicksand({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.maxLines,
    this.decoration,
  });

  final String text;
  final Color? color;
  final double? size;
  final int? maxLines;
  final bool? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.quicksand(
        color: color ?? blue,
        fontWeight: FontWeight.bold,
        fontSize: size ?? 40,
        decoration: (decoration != null && decoration == true)
            ? TextDecoration.lineThrough
            : TextDecoration.none,
      ),
    );
  }
}

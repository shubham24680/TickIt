import 'package:cool_pages/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

buildAppBar(String text, Color backgroundColor, Color forgroundColor) {
  return AppBar(
    backgroundColor: backgroundColor,
    surfaceTintColor: backgroundColor,
    leading: Builder(
      builder: (context) => CIcon(
        onPressed: () => Scaffold.of(context).openDrawer(),
        image: 'assets/icons/menu.svg',
        color: forgroundColor,
      ),
    ),
    title: Wrap(
      children: [
        CHeading(text: "my", color: forgroundColor),
        CHeading(text: text, color: white),
      ],
    ),
    centerTitle: true,
    actions: [
      CIcon(
        onPressed: () {},
        image: 'assets/icons/search.svg',
        color: forgroundColor,
      )
    ],
  );
}

class CIcon extends StatelessWidget {
  const CIcon(
      {super.key, required this.image, required this.onPressed, this.color});

  final String image;
  final Function() onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        image,
        colorFilter: ColorFilter.mode(color ?? darkBlue, BlendMode.srcIn),
      ),
    );
  }
}

class CHeading extends StatelessWidget {
  const CHeading({super.key, required this.text, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Maven',
        color: color ?? darkBlue,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}

class CTitle extends StatelessWidget {
  const CTitle({
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

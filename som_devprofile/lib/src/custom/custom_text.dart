import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      required this.fontSize,
      this.isTextAlignCenter = true,
      this.color = Colors.white})
      : super(key: key);

  final String text;
  final Color color;
  final double fontSize;
  final bool isTextAlignCenter;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
      ),
      textAlign: isTextAlignCenter ? TextAlign.center : TextAlign.left,
    );
  }
}

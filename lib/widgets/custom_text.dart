import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight? fontWeight;
  final double size;
  final int? maxLines;
  final String? fontFamily;
  const CustomText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontWeight,
    this.size = 16.0,
    this.maxLines, this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: size,
        color: color,
        fontFamily: fontFamily
      ),
    );
  }
}

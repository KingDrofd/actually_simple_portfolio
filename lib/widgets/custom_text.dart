import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.strokeColor = Colors.black,
    this.textColor = Colors.grey,
    this.textStyle,
    required this.text,
    this.fontSize = 24,
    this.strokeWidth = 6,
    this.paintingStyle = PaintingStyle.stroke,
    this.shadow,
  });
  final List<Shadow>? shadow;
  final String text;
  final double fontSize;
  final double strokeWidth;
  final PaintingStyle paintingStyle;
  final Color strokeColor;
  final Color textColor;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          text,
          style: TextStyle(
            shadows: shadow,
            fontSize: fontSize,
            foreground: Paint()
              ..style = paintingStyle
              ..strokeWidth = strokeWidth
              ..color = strokeColor,
          ),
        ),
        // Solid text as fill.
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ],
    );
  }
}

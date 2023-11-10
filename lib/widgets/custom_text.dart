import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          style: GoogleFonts.ubuntu(
            shadows: shadow,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = paintingStyle
              ..strokeWidth = strokeWidth
              ..color = strokeColor,
          ),
        ),
        // Solid text as fill.
        Text(
          text,
          style: GoogleFonts.ubuntu(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: textColor,
            shadows: shadow,
          ),
        ),
      ],
    );
  }
}

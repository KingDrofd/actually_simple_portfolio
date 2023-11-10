import 'dart:ui';

import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.width,
    this.height,
    this.color = Colors.white,
    this.child,
    this.radius = 0.0,
    this.borderOpacity = 0.2,
    this.borderWidth = 1.5,
    this.isBlur = false,
    this.blur = 0.0,
    this.borderColor = Colors.white,
    this.colorOpacity = 1,
  });

  final double? width;
  final double? height;
  final Color color;
  final Widget? child;
  final bool isBlur;
  final double blur;
  final double radius;
  final Color borderColor;
  final double borderOpacity;
  final double borderWidth;
  final double colorOpacity;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color.withOpacity(colorOpacity),
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
            border: Border.all(
              color: borderColor.withOpacity(borderOpacity),
              width: borderWidth,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

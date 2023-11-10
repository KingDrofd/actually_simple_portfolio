import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PageLogo extends StatelessWidget {
  const PageLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 1000,
      ),
      child: LottieBuilder.asset(
        "assets/logo.json",
        width: 100,
        height: 100,
      ),
    );
  }
}

import 'package:actually_simple_portfolio/sections/topSection/components/introduction.dart';
import 'package:actually_simple_portfolio/sections/topSection/components/menu.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class TopSection extends StatefulWidget {
  const TopSection({super.key});

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: 700,
      //decoration: _buildBackground(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Gap(25),
          _buildLogo(),
          const Gap(25),
          const Introductin(),
          const Gap(50),
          const Menu(),
        ],
      ),
    );
  }

  BoxDecoration _buildBackground() {
    return const BoxDecoration(
      image: DecorationImage(
        colorFilter: ColorFilter.mode(
          Color.fromARGB(210, 236, 232, 249),
          BlendMode.color,
        ),
        fit: BoxFit.cover,
        image: AssetImage(
          "assets/bg.png",
        ),
      ),
    );
  }

  Padding _buildLogo() {
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

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
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 860;

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12),
      width: 1100,
      height: 700,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Gap(25),
          //_buildLogo(),
          const Gap(25),
          const Introductin(),
          const Gap(50),
          if (isDesktop(context)) const Menu(),
        ],
      ),
    );
  }

  // BoxDecoration _buildBackground() {
  //   return const BoxDecoration(
  //     image: DecorationImage(
  //       colorFilter: ColorFilter.mode(
  //         Color.fromARGB(210, 236, 232, 249),
  //         BlendMode.color,
  //       ),
  //       fit: BoxFit.cover,
  //       image: AssetImage(
  //         "assets/bg.png",
  //       ),
  //     ),
  //   );
  // }

  Widget _buildLogo() {
    return Align(
      alignment: Alignment.centerLeft,
      child: LottieBuilder.asset(
        "assets/logo.json",
        width: 100,
        height: 100,
      ),
    );
  }
}

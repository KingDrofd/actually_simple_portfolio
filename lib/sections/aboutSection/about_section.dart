import 'package:actually_simple_portfolio/constants.dart';
import 'package:actually_simple_portfolio/sections/aboutSection/components/about_me.dart';
import 'package:actually_simple_portfolio/sections/aboutSection/years_of.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    if ((MediaQuery.sizeOf(context).width) < 1100) {
      isPhone = true;
    } else {
      isPhone = false;
    }
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12),
      width: 1110,
      child: Flex(
        direction: isPhone ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AboutMeLeft(),
          Gap(isPhone ? 50 : 0),
          YearsOfExperience(),
        ],
      ),
    );
  }
}

import 'package:actually_simple_portfolio/constants.dart';
import 'package:actually_simple_portfolio/sections/aboutSection/years_of.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    if ((MediaQuery.sizeOf(context).width) < 700) {
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
          _buildLeftAbout(),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              YearsOfExperience(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLeftAbout() {
    return Container(
      child: Flex(
        direction: isPhone ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flex(
            direction: isPhone ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "About\nMe",
                style: GoogleFonts.ubuntu(
                  fontSize: isPhone ? 40 : 60,
                  letterSpacing: -0.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(20),
              Text(
                "Signature\nHere",
                style: GoogleFonts.ubuntu(
                  fontSize: isPhone ? 30 : 40,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Gap(isPhone ? 10 : 38),
          _aboutMeText(),
        ],
      ),
    );
  }

  Container _aboutMeText() {
    return Container(
      width: isPhone ? 400 : 240,
      height: 240,
      alignment: Alignment.center,
      child: SelectableText(
        lorem(paragraphs: 1, words: 50),
        style: GoogleFonts.ubuntu(
          letterSpacing: 0.1,
          fontSize: 17,
          color: Colors.black,
        ),
      ),
    );
  }
}

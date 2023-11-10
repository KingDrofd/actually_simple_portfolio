import 'package:actually_simple_portfolio/sections/aboutSection/years_of.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildLeftAbout(),
        Gap(200),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            YearsOfExperience(),
            Gap(50),
            _aboutMeText(),
          ],
        ),
      ],
    );
  }

  Column _buildLeftAbout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "About Me",
          style: GoogleFonts.ubuntu(
            fontSize: 40,
            letterSpacing: -0.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap(100),
        Text(
          "Signature Here",
          style: GoogleFonts.ubuntu(
            fontSize: 40,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Container _aboutMeText() {
    return Container(
      width: 300,
      height: 300,
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

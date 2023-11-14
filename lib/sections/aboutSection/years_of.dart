import 'package:actually_simple_portfolio/constants.dart';
import 'package:actually_simple_portfolio/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class YearsOfExperience extends StatelessWidget {
  const YearsOfExperience({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if ((MediaQuery.sizeOf(context).width) < 700) {
      isPhone = true;
    } else {
      isPhone = false;
    }
    return Flex(
      direction: isPhone ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(247, 232, 255, 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(237, 210, 252, 1),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: -1.3,
                    offset: Offset(0, 1.8),
                    color: Color.fromRGBO(219, 154, 219, 1),
                  ),
                ],
              ),
              width: 200,
              height: 200,
            ),
            _buildYearsOfText()
          ],
        ),
        Gap(isPhone ? 10 : 45),
        _yearsOfStory()
      ],
    );
  }

  Container _yearsOfStory() {
    return Container(
      width: isPhone ? 400 : 240,
      height: 240,
      alignment: Alignment.center,
      child: SelectableText(
        lorem(paragraphs: 1, words: 50),
        style: GoogleFonts.quicksand(
          letterSpacing: 0.1,
          fontSize: 17,
          color: Colors.black,
        ),
      ),
    );
  }

  Column _buildYearsOfText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomText(
          text: "03",
          strokeColor: Color.fromRGBO(219, 154, 219, 1),
          textColor: Colors.white,
          fontSize: 90,
          strokeWidth: 6,
          shadow: [
            Shadow(
              color: Color.fromARGB(255, 211, 134, 253), // Shadow color
              offset: Offset(0, 6), // Shadow offset
              blurRadius: 4, // Shadow blur radius
            ),
          ],
        ),
        Gap(20),
        CustomText(
          text: "Years of experience",
          strokeColor: Colors.transparent,
          textColor: Color.fromRGBO(219, 154, 219, 1),
          fontSize: 18,
          strokeWidth: 0,
        ),
      ],
    );
  }
}

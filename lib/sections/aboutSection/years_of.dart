import 'package:actually_simple_portfolio/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class YearsOfExperience extends StatelessWidget {
  const YearsOfExperience({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(247, 232, 255, 1),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
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
          width: 250,
          height: 250,
        ),
        _buildYearsOfText()
      ],
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
          fontSize: 100,
          strokeWidth: 6,
          shadow: [
            Shadow(
              color: Color.fromARGB(255, 211, 134, 253), // Shadow color
              offset: Offset(0, 6), // Shadow offset
              blurRadius: 4, // Shadow blur radius
            ),
          ],
        ),
        Gap(40),
        CustomText(
          text: "Years of experience",
          strokeColor: Colors.transparent,
          textColor: Color.fromRGBO(219, 154, 219, 1),
          fontSize: 20,
          strokeWidth: 0,
        ),
      ],
    );
  }
}

import 'package:actually_simple_portfolio/constants.dart';
import 'package:actually_simple_portfolio/widgets/custom_outlined_button.dart';
import 'package:actually_simple_portfolio/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AboutButtons extends StatelessWidget {
  const AboutButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if ((MediaQuery.sizeOf(context).width) < 700) {
      isPhone = true;
    } else {
      isPhone = false;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomOutlinedButton(
          text: "Hire Me!",
          press: () {},
          imageSrc: "assets/handshake.png",
        ),
        Gap(isPhone ? 15 : 50),
        CustomTextButton(
          text: isPhone ? "Resumé" : "Save my Resumé",
          press: () {},
          imageSrc: "assets/FloppyDisk.png",
        ),
      ],
    );
  }
}

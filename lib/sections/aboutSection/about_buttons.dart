import 'dart:html';

import 'package:actually_simple_portfolio/constants.dart';
import 'package:actually_simple_portfolio/utils/check_phone.dart';
import 'package:actually_simple_portfolio/widgets/custom_outlined_button.dart';
import 'package:actually_simple_portfolio/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutButtons extends StatelessWidget {
  const AboutButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomOutlinedButton(
          text: "Hire Me!",
          press: () {},
          imageSrc: "assets/handshake.png",
        ),
        Gap(checkPhone(context) ? 30 : 50),
        CustomTextButton(
          text: checkPhone(context) ? "Resumé" : "Save my Resumé",
          press: () {
            final string = "assets/thesis.pdf";
            final uri = Uri.parse(string);
            launchUrl(uri);
          },
          imageSrc: "assets/FloppyDisk.png",
        ),
      ],
    );
  }
}

import 'package:actually_simple_portfolio/utils/check_phone.dart';
import 'package:actually_simple_portfolio/widgets/custom_outlined_button.dart';
import 'package:actually_simple_portfolio/widgets/custom_text_button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutButtons extends StatelessWidget {
  const AboutButtons({
    super.key,
    required this.autoScrollController,
  });
  final AutoScrollController autoScrollController;
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomOutlinedButton(
          text: "Hire Me!",
          press: () {
            autoScrollController.scrollToIndex(5);
          },
          imageSrc: "assets/handshake.png",
        ),
        Gap(checkPhone(context) ? 30 : 50),
        CustomTextButton(
          text: checkPhone(context) ? "Resumé" : "Save my Resumé",
          press: () {
            // final string = "assets/thesis.pdf";
            // final uri = Uri.parse(string);
            // launchUrl(uri);
            downloadFile();
          },
          imageSrc: "assets/FloppyDisk.png",
        ),
      ],
    );
  }

  Future<void> downloadFile() async {
    try {
      final storage = FirebaseStorage.instance;
      final Reference storageReference =
          storage.ref().child('Regad Abdellah Resume.pdf');
      final String downloadURL = await storageReference.getDownloadURL();
      final uri = Uri.parse(downloadURL);
      launchUrl(uri);
    } catch (e) {
      print('Error downloading file: $e');
    }
  }
}

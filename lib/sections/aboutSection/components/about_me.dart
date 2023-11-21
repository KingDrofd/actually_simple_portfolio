import 'package:actually_simple_portfolio/constants.dart';
import 'package:actually_simple_portfolio/utils/check_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMeLeft extends StatelessWidget {
  const AboutMeLeft({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if ((MediaQuery.sizeOf(context).width) < 700) {
      isPhone = true;
    } else {
      isPhone = false;
    }
    var sizedBox = SizedBox(
      width: isPhone ? 400 : 240,
      child: Flex(
        direction: isPhone ? Axis.horizontal : Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "About\nMe",
            style: GoogleFonts.quicksand(
              fontSize: isPhone ? 40 : 50,
              letterSpacing: -0.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(20),
          Image.asset(
            "assets/signature.png",
            height: checkPhone(context) ? 80 : 120,
          ),
        ],
      ),
    );
    return Container(
      child: Flex(
        direction: isPhone ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          sizedBox,
          Gap(isPhone ? 10 : 55),
          Container(
            width: isPhone ? 400 : 240,
            height: 240,
            alignment: Alignment.center,
            child: SelectableText(
              "🚀 Hi, I'm Abdellah, a software developer passionate about"
              " Flutter. I bring ideas to life through code, and dabble in 3D "
              "design. In my spare time, I turn my creative energy into game "
              "development 👾💻✨",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w400,
                // letterSpacing: -.5,
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

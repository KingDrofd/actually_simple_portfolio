import 'package:actually_simple_portfolio/constants.dart';
import 'package:actually_simple_portfolio/utils/check_phone.dart';
import 'package:actually_simple_portfolio/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ProjectEstimate extends StatelessWidget {
  const ProjectEstimate({
    super.key,
    required this.autoScrollController,
  });
  final AutoScrollController autoScrollController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(0, 40),
              blurRadius: 50,
              color: Color.fromARGB(149, 6, 0, 177),
              spreadRadius: -120,
            ),
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 50,
              color: Color.fromARGB(45, 6, 0, 177),
              spreadRadius: 10,
            )
          ],
        ),
        alignment: Alignment.topCenter,
        width: checkPhone(context) ? 350 : 1100,
        height: checkPhone(context, size: 720) ? 250 : 150,
        child: Flex(
          direction:
              checkPhone(context, size: 720) ? Axis.vertical : Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flex(
              mainAxisAlignment: MainAxisAlignment.start,
              direction: checkPhone(context, size: 700)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Center(
                  child: Image.asset(
                    "assets/icons/letter.png",
                    height: checkPhone(context, size: 960) ? 50 : 90,
                  ),
                ),
                Gap(checkPhone(context) ? 0 : 30),
                if (!checkPhone(context, size: 700))
                  Container(
                    height: 90,
                    width: 2,
                    color: const Color.fromARGB(255, 212, 212, 212),
                  ),
                Gap(checkPhone(context) ? 0 : 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: checkPhone(context)
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Starting a new project?",
                      style: GoogleFonts.quicksand(
                          fontSize: checkPhone(context, size: 900) ? 30 : 40,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    if (!checkPhone(context))
                      Text(
                        "Get an estimate!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.quicksand(
                          fontSize: checkPhone(context, size: 900) ? 15 : 20,
                        ),
                      ),
                  ],
                ),
              ],
            ),
            CustomOutlinedButton(
              text: "Contact Me!",
              press: () {
                autoScrollController.scrollToIndex(5);
              },
              imageSrc: "assets/handshake.png",
            ),
          ],
        ),
      ),
    );
  }
}

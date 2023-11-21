import 'package:actually_simple_portfolio/constants.dart';
import 'package:actually_simple_portfolio/utils/check_phone.dart';
import 'package:actually_simple_portfolio/widgets/custom_offering_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Offerings extends StatelessWidget {
  const Offerings({super.key});

  @override
  Widget build(BuildContext context) {
    double currentSize = MediaQuery.sizeOf(context).width;

    return Container(
      padding: EdgeInsets.only(left: 12, right: 12),
      width: checkPhone(context, size: 1100) ? 550 : 1100,
      constraints: const BoxConstraints(maxWidth: 1100),
      height: checkPhone(context, size: 1100) ? 720 : 530,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 5,
                    height: checkPhone(context, size: 600) ? 15 : 30,
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.black,
                    width: 5,
                    height: checkPhone(context, size: 600) ? 40 : 60,
                  )
                ],
              ),
              const Gap(10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Strong Areas",
                    style: GoogleFonts.quicksand(
                        fontSize: checkPhone(context, size: 600) ? 15 : 20),
                  ),
                  Text(
                    "Offerings",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: checkPhone(context, size: 600) ? 30 : 60,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(50),
          Container(
            alignment: Alignment.center,
            width: checkPhone(context, size: 693) ? 400 : 1100,
            height: checkPhone(context, size: 1100) ? 550 : 260,
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              clipBehavior:
                  checkPhone(context, size: 1100) ? Clip.none : Clip.none,
              crossAxisSpacing: checkPhone(context, size: 960) ? 10 : 20,
              mainAxisSpacing: checkPhone(context, size: 960) ? 10 : 20,
              scrollDirection: checkPhone(context, size: 1100)
                  ? Axis.vertical
                  : Axis.horizontal,
              crossAxisCount: checkPhone(context, size: 1100) ? 2 : 1,
              children: const [
                CustomOfferingCard(
                  image: "assets/icons/web_design.png",
                  text: "Web & Mobile Design",
                  color: Color.fromARGB(255, 217, 255, 252),
                  shadowColor: Color.fromARGB(255, 142, 255, 246),
                  imageSize: 80,
                  offsetRight: 4,
                ),
                CustomOfferingCard(
                  imageSize: 80,
                  image: "assets/icons/ui_design.png",
                  text: "UI Design",
                ),
                CustomOfferingCard(
                  imageSize: 80,
                  image: "assets/icons/3d_design.png",
                  text: "3D Design",
                  color: Color.fromARGB(255, 254, 224, 224),
                  shadowColor: Color.fromARGB(255, 255, 183, 183),
                ),
                CustomOfferingCard(
                  text: "Backend",
                  color: Color.fromARGB(255, 254, 243, 221),
                  shadowColor: Color.fromARGB(255, 255, 218, 143),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:actually_simple_portfolio/constants.dart';
import 'package:actually_simple_portfolio/widgets/custom_offering_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Offerings extends StatelessWidget {
  const Offerings({super.key});

  @override
  Widget build(BuildContext context) {
    double currentSize = MediaQuery.sizeOf(context).width;

    if ((MediaQuery.sizeOf(context).width) < 1100) {
      isPhone = true;
    } else {
      isPhone = false;
    }
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12),
      width: isPhone ? 550 : 1100,
      constraints: const BoxConstraints(maxWidth: 1100),
      height: isPhone ? 720 : 1100,
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
                    width: 10,
                    height: 30,
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.black,
                    width: 10,
                    height: 80,
                  )
                ],
              ),
              const Gap(10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Strong Arenas",
                    style: GoogleFonts.oswald(fontSize: 20),
                  ),
                  Text(
                    "Service Offerings",
                    style: GoogleFonts.oswald(fontSize: 56),
                  ),
                ],
              ),
            ],
          ),
          Gap(50),
          Container(
            alignment: Alignment.center,
            width: isPhone ? 550 : 1100,
            height: isPhone ? 550 : 260,
            child: GridView.count(
              clipBehavior: isPhone ? Clip.hardEdge : Clip.none,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              scrollDirection: isPhone ? Axis.vertical : Axis.horizontal,
              crossAxisCount: isPhone ? 2 : 1,
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

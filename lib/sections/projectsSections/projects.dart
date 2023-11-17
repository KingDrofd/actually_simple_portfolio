import 'package:actually_simple_portfolio/utils/check_phone.dart';
import 'package:actually_simple_portfolio/widgets/custom_project_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8),
      width: 1100,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 5,
                    height: 30,
                    color: Colors.amber,
                  ),
                  Container(
                    color: Colors.black,
                    width: 5,
                    height: 60,
                  )
                ],
              ),
              const Gap(10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Projects",
                    style: GoogleFonts.quicksand(
                        fontSize: checkPhone(context, size: 600) ? 15 : 20),
                  ),
                  Text(
                    "Recent Works",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: checkPhone(context, size: 600) ? 45 : 50,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(50),
          Flex(
            mainAxisAlignment: MainAxisAlignment.start,
            direction: checkPhone(context) ? Axis.vertical : Axis.horizontal,
            children: [
              Expanded(
                  flex: checkPhone(context) ? 0 : 1,
                  child: CustomProjectCard(
                    projectFocus: "Unity Plugin",
                    projectDescription: "Custom Character Controller",
                    url: "https://github.com/KingDrofd/CCC",
                    shadowColor: Color.fromARGB(255, 255, 183, 183),
                  )),
              Gap(30),
              Expanded(
                  flex: checkPhone(context) ? 0 : 1,
                  child: CustomProjectCard(
                    shadowColor: Color.fromARGB(255, 255, 183, 183),
                    projectFocus: "Unity Plugin",
                    projectDescription: "Custom Parallax Effect For 2D Games",
                    url: "https://github.com/KingDrofd/Parallax2D",
                  )),
            ],
          ),
          Gap(30),
          Flex(
            mainAxisAlignment: MainAxisAlignment.start,
            direction: checkPhone(context) ? Axis.vertical : Axis.horizontal,
            children: [
              Expanded(
                  flex: checkPhone(context) ? 0 : 1,
                  child: CustomProjectCard(
                    shadowColor: Color.fromARGB(255, 142, 255, 246),
                    projectFocus: "Website Portfolio",
                    projectDescription:
                        "Web Portfolio Inspired By The Game Nier Automata",
                    image: "assets/folder.png",
                    url: "https://kingdrofd.github.io/#/",
                  )),
              Gap(30),
              Expanded(
                  flex: checkPhone(context) ? 0 : 1,
                  child: CustomProjectCard(
                    shadowColor: Color.fromARGB(255, 255, 218, 143),
                    projectFocus: "Flutter",
                    image: "assets/share to glass alt.png",
                    projectDescription:
                        "Simple Local Sharing App Between Phone And Pc",
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

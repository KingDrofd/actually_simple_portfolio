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
      padding: const EdgeInsets.only(left: 8, right: 8),
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
                    height: checkPhone(context, size: 600) ? 15 : 30,
                    color: Colors.amber,
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
                    "My Projects",
                    style: GoogleFonts.quicksand(
                        fontSize: checkPhone(context, size: 600) ? 15 : 20),
                  ),
                  Text(
                    "Recent Works",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: checkPhone(context, size: 600) ? 30 : 60,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Gap(50),
          Flex(
            mainAxisAlignment: MainAxisAlignment.start,
            direction: checkPhone(context) ? Axis.vertical : Axis.horizontal,
            children: [
              Expanded(
                  flex: checkPhone(context) ? 0 : 1,
                  child: CustomProjectCard(
                    image: checkPhone(context, size: 900)
                        ? "assets/untitled-min.png"
                        : "assets/untitled.png",
                    projectFocus: "Unity Plugin",
                    projectDescription: "Custom Character Controller",
                    url: "https://github.com/KingDrofd/CCC",
                    shadowColor: Color.fromARGB(255, 255, 183, 183),
                  )),
              const Gap(30),
              Expanded(
                  flex: checkPhone(context) ? 0 : 1,
                  child: CustomProjectCard(
                    image: checkPhone(context, size: 900)
                        ? "assets/untitled-min.png"
                        : "assets/untitled.png",
                    shadowColor: Color.fromARGB(255, 255, 183, 183),
                    projectFocus: "Unity Plugin",
                    projectDescription: "Custom Parallax Effect For 2D Games",
                    url: "https://github.com/KingDrofd/Parallax2D",
                  )),
            ],
          ),
          const Gap(30),
          Flex(
            mainAxisAlignment: MainAxisAlignment.start,
            direction: checkPhone(context) ? Axis.vertical : Axis.horizontal,
            children: [
              Expanded(
                  flex: checkPhone(context) ? 0 : 1,
                  child: CustomProjectCard(
                    image: checkPhone(context, size: 900)
                        ? "assets/folder_alt-min.png"
                        : "assets/folder_alt.png",
                    shadowColor: Color.fromARGB(255, 142, 255, 246),
                    projectFocus: "Website Portfolio",
                    projectDescription:
                        "Web Portfolio Inspired By The Game Nier Automata",
                    url: "https://kingdrofd.github.io/nier-portfolio",
                  )),
              const Gap(30),
              Expanded(
                  flex: checkPhone(context) ? 0 : 1,
                  child: CustomProjectCard(
                    image: checkPhone(context, size: 900)
                        ? "assets/share to glass alt-min.png"
                        : "assets/share to glass alt.png",
                    shadowColor: Color.fromARGB(255, 255, 218, 143),
                    projectFocus: "Flutter",
                    projectDescription:
                        "Simple Local Sharing App Between Phone And Pc",
                    url: "https://github.com/KingDrofd/open_with_desktop",
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

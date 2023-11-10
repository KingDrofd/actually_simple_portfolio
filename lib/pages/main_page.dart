import 'package:actually_simple_portfolio/sections/topSection/top_section.dart';
import 'package:actually_simple_portfolio/widgets/custom_outlined_button.dart';
import 'package:actually_simple_portfolio/widgets/custom_text.dart';
import 'package:actually_simple_portfolio/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late RiveAnimationController _riveController;
  late ScrollController _scrollController;

  void onHover() {
    setState(() {
      setState(() {
        _riveController.isActive = true;
      });
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _riveController = OneShotAnimation("onPressed");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebSmoothScroll(
        scrollOffset: 100,
        controller: _scrollController,
        animationDuration: 500,
        curve: Curves.decelerate,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // const TopSection(),
              const Gap(100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "About Me",
                        style: GoogleFonts.ubuntu(
                          fontSize: 40,
                          letterSpacing: -0.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(200),
                      Text(
                        "Signature Here",
                        style: GoogleFonts.ubuntu(
                          fontSize: 40,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Gap(200),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
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
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomText(
                                text: "03",
                                strokeColor: Colors.white,
                                textColor: Color.fromRGBO(219, 154, 219, 1),
                                fontSize: 80,
                                strokeWidth: 4,
                                shadow: [
                                  Shadow(
                                    color: Color.fromRGBO(
                                        194, 135, 194, 1), // Shadow color
                                    offset: Offset(0, 2), // Shadow offset
                                    blurRadius: 6, // Shadow blur radius
                                  ),
                                ],
                              ),
                              Gap(40),
                              CustomText(
                                text: "Years of experience",
                                strokeColor: Colors.transparent,
                                textColor: Color.fromRGBO(219, 154, 219, 1),
                                fontSize: 25,
                                strokeWidth: 0,
                              ),
                            ],
                          )
                        ],
                      ),
                      Gap(50),
                      SizedBox(
                        width: 300,
                        height: 300,
                        child: SelectableText(
                          lorem(paragraphs: 1, words: 50),
                          style: GoogleFonts.ubuntu(
                            letterSpacing: 0.1,
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomOutlinedButton(
                    text: "Hire Me!",
                    press: () {},
                    imageSrc: "assets/FloppyDisk.png",
                  ),
                  CustomTextButton(
                    text: "Save my Resumé",
                    press: () {},
                    imageSrc: "assets/FloppyDisk.png",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

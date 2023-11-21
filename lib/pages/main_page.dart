import 'package:actually_simple_portfolio/constants.dart';
import 'package:actually_simple_portfolio/sections/aboutSection/about_buttons.dart';
import 'package:actually_simple_portfolio/sections/aboutSection/about_section.dart';
import 'package:actually_simple_portfolio/sections/contactSection/contact.dart';
import 'package:actually_simple_portfolio/sections/offeringsSection/components/project_estimate.dart';
import 'package:actually_simple_portfolio/sections/offeringsSection/offerings.dart';
import 'package:actually_simple_portfolio/sections/projectsSections/projects.dart';
import 'package:actually_simple_portfolio/sections/testimonialSection/tesimonials.dart';
import 'package:actually_simple_portfolio/sections/topSection/components/backgrounds.dart';
import 'package:actually_simple_portfolio/sections/topSection/components/menu.dart';
import 'package:actually_simple_portfolio/sections/topSection/top_section.dart';
import 'package:actually_simple_portfolio/utils/check_phone.dart';

import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:rive/rive.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

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
    final aboutKey = GlobalKey();
    final offeringsKey = GlobalKey();
    final projectsKey = GlobalKey();
    final testimonialKey = GlobalKey();
    final topKey = GlobalKey();
    final contactKey = GlobalKey();

    AutoScrollController _scrollController = AutoScrollController();
    Menu myMenu = Menu(autoScrollController: _scrollController);
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          WebSmoothScroll(
            scrollOffset: 100,
            controller: _scrollController,
            animationDuration: 500,
            curve: Curves.decelerate,
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: checkPhone(context, size: 960)
                  ? ScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  BuildBackgrounds(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoScrollTag(
                        key: topKey,
                        index: 0,
                        controller: _scrollController,
                        child: TopSection(
                          autoScrollController: _scrollController,
                        ),
                      ),
                      Gap(isPhone ? 100 : 100),
                      AutoScrollTag(
                        key: aboutKey,
                        index: 1,
                        controller: _scrollController,
                        child: AboutSection(),
                      ),
                      Gap(100),
                      AboutButtons(
                        autoScrollController: _scrollController,
                      ),
                      Gap(isPhone ? 100 : 100),
                      AutoScrollTag(
                        key: offeringsKey,
                        index: 2,
                        controller: _scrollController,
                        child: Offerings(),
                      ),
                      Gap(50),
                      ProjectEstimate(
                        autoScrollController: _scrollController,
                      ),
                      Gap(100),
                      AutoScrollTag(
                        key: projectsKey,
                        index: 3,
                        controller: _scrollController,
                        child: Projects(),
                      ),
                      Gap(200),
                      AutoScrollTag(
                        key: testimonialKey,
                        index: 4,
                        controller: _scrollController,
                        child: Testimonials(),
                      ),
                      Gap(150),
                      AutoScrollTag(
                        key: contactKey,
                        index: 5,
                        controller: _scrollController,
                        child: Contact(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          _scrollController.scrollToIndex(0);
          setState(() {
            myMenu.resetSelectedIndex();
          });
        },
        child: Icon(
          Icons.arrow_upward,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }
}

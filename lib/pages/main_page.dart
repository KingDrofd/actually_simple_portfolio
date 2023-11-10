import 'package:actually_simple_portfolio/sections/topSection/top_section.dart';
import 'package:actually_simple_portfolio/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
    final screenSize = MediaQuery.of(context).size;

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
              TopSection(),
              Gap(100),
              CustomTextButton(
                text: "Save my Resumé",
                press: () {},
                imageSrc: "assets/FloppyDisk.png",
              )
            ],
          ),
        ),
      ),
    );
  }
}

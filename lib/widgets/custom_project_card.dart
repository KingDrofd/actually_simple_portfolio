import 'package:actually_simple_portfolio/utils/check_phone.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomProjectCard extends StatefulWidget {
  const CustomProjectCard({
    super.key,
    this.shadowColor = const Color.fromARGB(149, 6, 0, 177),
    this.projectDescription = "New & Fresh Looking "
        " Portfolio indeed at the end",
    this.projectFocus = "Project Focus",
    this.url = "https://youtu.be/dQw4w9WgXcQ",
    this.image = "assets/untitled.png",
  });
  final String projectDescription;
  final String projectFocus;
  final String url;
  final String image;
  final Color shadowColor;
  @override
  State<CustomProjectCard> createState() => _CustomProjectCardState();
}

class _CustomProjectCardState extends State<CustomProjectCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isHovered = false;
  late Animation<double> animation;
  late Animation<double> shadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    animation = Tween<double>(begin: 0, end: -5)
        .chain(
          CurveTween(curve: Curves.easeInOutCubic),
        )
        .animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    shadeAnimation = Tween<double>(begin: 0, end: .6)
        .chain(
          CurveTween(curve: Curves.easeIn),
        )
        .animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height;
    double width;

    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHovered = true;
          _animationController.forward();
        });
      },
      onExit: (event) {
        setState(() {
          _isHovered = false;
          _animationController.reverse();
        });
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (checkPhone(context) && _isHovered == false) {
              _isHovered = true;
              _animationController.forward();
            } else {
              _isHovered = false;
              _animationController.reverse();
            }
          });
          final string = widget.url;
          final uri = Uri.parse(string);
          launchUrl(uri);
        },
        child: Transform.translate(
          offset: Offset(0, animation.value),
          child: LayoutBuilder(builder: (context, snapshot) {
            return Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset:
                        Offset(0, checkPhone(context, size: 1120) ? 50 : 100),
                    blurRadius: 50,
                    color: widget.shadowColor.withOpacity(shadeAnimation.value),
                    spreadRadius: -80,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: checkPhone(context, size: 1120) ? 500 : 520,
              height: checkPhone(context, size: 1120) ? 100 : 320,
              child: Row(
                children: [
                  Gap(checkPhone(context, size: 1120) ? 10 : 0),
                  buildCardImage(),
                  Gap(30),
                  buildCardText(),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  SizedBox buildCardText() {
    return SizedBox(
      width: checkPhone(context, size: 1120) ? 200 : 230,
      height: checkPhone(context, size: 1120) ? 100 : 320,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!checkPhone(context, size: 1120))
            Text(
              widget.projectFocus,
              style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w500,
                  fontSize: checkPhone(context, size: 1120) ? 12 : 16),
            ),
          Text(
            widget.projectDescription,
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w600,
              fontSize: checkPhone(context, size: 1120) ? 16 : 27,
            ),
          ),
          if (!checkPhone(context, size: 1120)) buildLinkOpen(),
        ],
      ),
    );
  }

  MouseRegion buildLinkOpen() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          final string = widget.url;
          final uri = Uri.parse(string);
          launchUrl(uri);
        },
        child: Text(
          "View Details",
          style: GoogleFonts.quicksand(
            fontSize: checkPhone(context, size: 1120) ? 12 : 16,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Container buildCardImage() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            filterQuality:
                checkPhone(context) ? FilterQuality.none : FilterQuality.low,
            fit: BoxFit.cover,
            image: AssetImage(
              widget.image,
            ),
          ),
          borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.centerLeft,
      width: checkPhone(context, size: 1120) ? 80 : 255,
      height: checkPhone(context, size: 1120) ? 80 : double.maxFinite,
    );
  }
}

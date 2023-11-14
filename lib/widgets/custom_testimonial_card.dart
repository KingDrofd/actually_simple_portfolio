import 'package:actually_simple_portfolio/utils/check_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTestimonialCard extends StatefulWidget {
  const CustomTestimonialCard({
    super.key,
    this.color = const Color.fromARGB(255, 217, 255, 252),
    this.shadowColor = const Color.fromARGB(255, 142, 255, 246),
    this.image = "assets/placholder.png",
    this.name = "Some Guy",
    this.text,
  });

  final Color color;
  final Color shadowColor;
  final String image;
  final String name;
  final String? text;

  @override
  State<CustomTestimonialCard> createState() => _CustomTestimonialCardState();
}

class _CustomTestimonialCardState extends State<CustomTestimonialCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isHovered = false;
  late Animation<double> animation;
  late Animation<double> animOffset;
  late Animation<double> shadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    animation = Tween<double>(begin: 0, end: .3)
        .chain(
          CurveTween(curve: Curves.easeInOutCubic),
        )
        .animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    animOffset = Tween<double>(begin: 0, end: -5)
        .chain(
          CurveTween(curve: Curves.easeInOutCubic),
        )
        .animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    shadeAnimation = Tween<double>(begin: 0, end: 1)
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
        },
        child: Transform.translate(
          offset: Offset(0, animOffset.value),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 350,
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.color,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color:
                          widget.shadowColor.withOpacity(shadeAnimation.value),
                      offset: Offset(0, 80),
                      spreadRadius: -50,
                      blurRadius: 60,
                    ),
                  ],
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Gap(40),
                      SizedBox(
                        width: 250,
                        height: 180,
                        child: Text(
                          widget.text ?? lorem(paragraphs: 1, words: 20),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.quicksand(
                              color: Color.fromARGB(255, 100, 100, 100),
                              fontSize:
                                  checkPhone(context, size: 1120) ? 17 : 20,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      Gap(10),
                      Text(
                        widget.name,
                        style: GoogleFonts.quicksand(
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                          fontSize: checkPhone(context, size: 1120) ? 17 : 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, -70),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          widget.image,
                        ),
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:actually_simple_portfolio/constants.dart';
import 'package:actually_simple_portfolio/utils/check_phone.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOfferingCard extends StatefulWidget {
  const CustomOfferingCard({
    super.key,
    this.offsetRight = 0,
    this.text = "Card Text",
    this.imageSize = 60,
    this.image = "assets/icons/graphic_design.png",
    this.color = const Color.fromARGB(255, 228, 255, 199),
    this.shadowColor = const Color.fromARGB(255, 190, 255, 105),
  });
  final String text;
  final String image;
  final Color color;
  final double offsetRight;
  final Color shadowColor;
  final double imageSize;

  @override
  State<CustomOfferingCard> createState() => _CustomOfferingCardState();
}

class _CustomOfferingCardState extends State<CustomOfferingCard>
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
    animation = Tween<double>(begin: 0, end: .3)
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
      cursor: SystemMouseCursors.click,
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              bottom: _isHovered ? 5 : 0,
              child: Container(
                decoration: _buildOfferingCardDeco(),
                width: checkPhone(context, size: 700) ? 180 : 255,
                height: checkPhone(context, size: 700) ? 180 : 255,
                constraints: BoxConstraints(maxWidth: 255, maxHeight: 255),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Gap(checkPhone(context, size: 1100) ? 10 : 20),
                    _buildCardImage(),
                    const Gap(10),
                    _buildCardText(),
                    Gap(checkPhone(context, size: 1100) ? 10 : 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _buildCardText() {
    return Text(
      widget.text,
      style: GoogleFonts.oswald(
          fontSize: checkPhone(context, size: 700) ? 16 : 25),
    );
  }

  Stack _buildCardImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: checkPhone(context) ? 90 : 125,
          height: checkPhone(context) ? 90 : 125,
          decoration: _buildCardImageDeco(),
        ),
        Positioned(
          right: 0,
          left: widget.offsetRight,
          child: Image.asset(
            widget.image,
            width: checkPhone(context) ? 60 : widget.imageSize,
            height: checkPhone(context) ? 60 : widget.imageSize,
          ),
        ),
      ],
    );
  }

  BoxDecoration _buildCardImageDeco() {
    return BoxDecoration(
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black.withOpacity(animation.value),
            offset: const Offset(
              0,
              20,
            ),
            blurRadius: 40,
            spreadRadius: -10),
      ],
      color: Colors.white,
      shape: BoxShape.circle,
    );
  }

  BoxDecoration _buildOfferingCardDeco() {
    return BoxDecoration(
      color: widget.color,
      borderRadius: BorderRadius.circular(10),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: widget.shadowColor.withOpacity(shadeAnimation.value),
          offset: Offset(0, 80),
          spreadRadius: -50,
          blurRadius: 60,
        ),
      ],
    );
  }
}

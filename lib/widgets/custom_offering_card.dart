import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOfferingCard extends StatefulWidget {
  const CustomOfferingCard({
    super.key,
    this.offsetRight = 0,
    this.text = "Card Text",
    this.image = "assets/icons/graphic_design.png",
    this.color = const Color.fromARGB(255, 228, 255, 199),
    this.shadowColor = const Color.fromARGB(255, 198, 255, 121),
  });
  final String text;
  final String image;
  final Color color;
  final double offsetRight;
  final Color shadowColor;

  @override
  State<CustomOfferingCard> createState() => _CustomOfferingCardState();
}

class _CustomOfferingCardState extends State<CustomOfferingCard> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHovered = false;
        });
      },
      child: Container(
        alignment: Alignment.center,
        decoration: _buildOfferingCardDeco(),
        width: 200,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Gap(20),
            _buildCardImage(),
            const Gap(10),
            _buildCardText(),
            const Gap(20)
          ],
        ),
      ),
    );
  }

  Text _buildCardText() {
    return Text(
      widget.text,
      style: GoogleFonts.oswald(fontSize: 25),
    );
  }

  Stack _buildCardImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: _buildCardImageDeco(),
        ),
        Positioned(
          right: 0,
          left: widget.offsetRight,
          child: Image.asset(
            widget.image,
            width: 60,
            height: 60,
          ),
        ),
      ],
    );
  }

  BoxDecoration _buildCardImageDeco() {
    return BoxDecoration(
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: _isHovered ? Colors.black.withOpacity(.3) : Colors.transparent,
          offset: const Offset(
            0,
            30,
          ),
          blurRadius: 26,
          spreadRadius: -20,
        ),
      ],
      color: Colors.white,
      shape: BoxShape.circle,
    );
  }

  BoxDecoration _buildOfferingCardDeco() {
    return BoxDecoration(
      color: const Color.fromARGB(255, 228, 255, 199),
      borderRadius: BorderRadius.circular(10),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: _isHovered
              ? const Color.fromARGB(255, 198, 255, 121)
              : Colors.transparent,
          offset: Offset(0, 60),
          spreadRadius: -40,
          blurRadius: 40,
        ),
      ],
    );
  }
}

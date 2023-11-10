import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton(
      {super.key,
      required this.imageSrc,
      required this.text,
      this.press,
      this.textStyle});

  final String imageSrc, text;
  final Function()? press;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.grey,
        backgroundColor: const Color.fromARGB(255, 242, 240, 249),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20 * 2.5,
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color.fromARGB(255, 237, 237, 237)),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      onPressed: press,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imageSrc,
            height: 40,
          ),
          const Gap(20),
          Text(
            text,
            style: textStyle ??
                GoogleFonts.ubuntu(
                  letterSpacing: -0.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 22,
                ),
          ),
        ],
      ),
    );
  }
}

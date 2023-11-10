import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    this.textStyle,
    required this.imageSrc,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String imageSrc, text;
  final Function()? press;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 232, 240, 249),
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
                GoogleFonts.lobster(
                  color: Colors.black,
                  fontSize: 22,
                ),
          ),
        ],
      ),
    );
  }
}

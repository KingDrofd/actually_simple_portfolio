import 'package:actually_simple_portfolio/utils/check_phone.dart';
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
    return SizedBox(
      width: checkPhone(context) ? 160 : 280,
      height: checkPhone(context) ? 50 : 65,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Color.fromARGB(255, 0, 160, 160),
          backgroundColor: const Color.fromARGB(255, 232, 240, 249),
          padding: EdgeInsets.symmetric(
            vertical: checkPhone(context) ? 10 : 20,
            horizontal: checkPhone(context) ? 10 : 20,
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
              height: checkPhone(context, size: 900) ? 35 : 40,
            ),
            const Gap(20),
            Text(
              text,
              style: textStyle ??
                  GoogleFonts.quicksand(
                    letterSpacing: -0.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: checkPhone(context, size: 900) ? 16 : 22,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

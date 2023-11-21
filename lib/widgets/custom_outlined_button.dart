import 'package:actually_simple_portfolio/constants.dart';
import 'package:actually_simple_portfolio/utils/check_phone.dart';
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
    return SizedBox(
      width: checkPhone(context) ? 160 : 220,
      height: checkPhone(context) ? 50 : 65,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.grey,
          backgroundColor: const Color.fromARGB(255, 242, 240, 249),
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
            const Gap(10),
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

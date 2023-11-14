import 'package:actually_simple_portfolio/utils/check_phone.dart';
import 'package:flutter/material.dart';

class BuildBackgrounds extends StatelessWidget {
  const BuildBackgrounds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: 698,
          decoration: const BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Color.fromARGB(210, 236, 232, 249),
                BlendMode.color,
              ),
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/bg.png",
              ),
            ),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            double containerWidth = constraints.maxWidth;
            double containerHeight = 1270;

            if (containerWidth < 1100) {
              containerHeight = 1750;
            }
            if (containerWidth < 700) {
              containerHeight = 2100;
            }

            return Container(
              width: containerWidth,
              height: containerHeight,
              color: Colors.white,
              // child: Center(
              //   child: Text('Width: $containerWidth\nHeight: $containerHeight'),
              // ),
            );
          },
        ),
        // Container(
        //   width: double.maxFinite,
        //   height: checkPhone(context) && !checkPhone(context, size: 1000)
        //       ? 2050
        //       : 1300,
        //   color: Colors.white,
        // ),
        Container(
          width: double.maxFinite,
          height: 698,
          decoration: const BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Color.fromARGB(210, 236, 232, 249),
                BlendMode.color,
              ),
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/bg_img_2.png",
              ),
            ),
          ),
        ),
      ],
    );
  }
}

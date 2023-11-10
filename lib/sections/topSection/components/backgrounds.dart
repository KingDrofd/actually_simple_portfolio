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
        Container(
          width: double.maxFinite,
          height: 1400,
          color: Colors.white,
        ),
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

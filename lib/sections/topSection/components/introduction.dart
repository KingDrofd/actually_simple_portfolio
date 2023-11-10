import 'package:actually_simple_portfolio/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class Introductin extends StatelessWidget {
  const Introductin({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: 1100,
      height: 400,
      blur: 15,
      radius: 5,
      borderWidth: 0,
      colorOpacity: 0.1,
      borderOpacity: 0.0,
      child: _buildText(context),
    );
  }

  Column _buildText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hello World!",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
        const Text(
          "Regad \nAbdellah",
          style: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          "Flutter Developer",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
      ],
    );
  }
}

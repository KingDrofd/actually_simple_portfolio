import 'package:actually_simple_portfolio/utils/check_phone.dart';
import 'package:actually_simple_portfolio/widgets/custom_container.dart';
//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Introductin extends StatefulWidget {
  const Introductin({super.key});

  @override
  State<Introductin> createState() => _IntroductinState();
}

class _IntroductinState extends State<Introductin> {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: 1100,
      height: 400,
      blur: 7,
      radius: 10,
      borderWidth: 1,
      colorOpacity: 0.2,
      borderOpacity: .1,
      child: _buildText(context),
    );
  }

  @override
  void initState() {
    player.setAsset("assets/mp3/Mice On Venus.m4a", preload: true);

    player.play();
    super.initState();
  }

  Widget _buildText(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: checkPhone(context, size: 900)
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello World!",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white),
            ),
            Text(
              "Regad\nAbdellah",
              textAlign: checkPhone(context, size: 900)
                  ? TextAlign.center
                  : TextAlign.left,
              style: TextStyle(
                fontSize: checkPhone(context) ? 50 : 100,
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
        ),
        ElevatedButton(onPressed: () async {}, child: Text("PlayAudio"))
      ],
    );
  }
}

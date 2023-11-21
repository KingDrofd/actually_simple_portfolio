import 'package:actually_simple_portfolio/utils/check_phone.dart';
import 'package:actually_simple_portfolio/widgets/custom_container.dart';
//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class Introductin extends StatefulWidget {
  const Introductin({super.key});

  @override
  State<Introductin> createState() => _IntroductinState();
}

class _IntroductinState extends State<Introductin>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isHovered = false;
  late Animation<double> animation;

  late AudioPlayer player;
  bool isPlaying = false;
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
    player = AudioPlayer()..setAsset("assets/mp3/FirstFlightSoundtrack.m4a");
    player.setVolume(.06);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = Tween<double>(begin: 150, end: 200)
        .chain(
          CurveTween(curve: Curves.easeInOutCubic),
        )
        .animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildText(BuildContext context) {
    return Row(
      mainAxisAlignment: checkPhone(context)
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 300,
          height: 300,
          child: Column(
            crossAxisAlignment: checkPhone(context, size: 900)
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Hello World!",
                style: GoogleFonts.quicksand(
                    color: const Color.fromARGB(255, 52, 52, 52),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Regad Abdellah",
                textAlign: checkPhone(context, size: 900)
                    ? TextAlign.center
                    : TextAlign.left,
                style: GoogleFonts.quicksand(
                  fontSize: checkPhone(context) ? 50 : 60,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 60, 60, 60),
                ),
              ),
              Text(
                "Flutter Developer!",
                style: GoogleFonts.quicksand(
                    color: const Color.fromARGB(255, 69, 69, 69),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        if (!checkPhone(context))
          Row(
            children: [
              RotatedBox(
                quarterTurns: -1,
                child: Text(
                  "Always ready for a challenge!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(
                      color: const Color.fromARGB(255, 52, 52, 52),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Gap(10),
              Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    shape: BoxShape.rectangle,
                    color: Color.fromARGB(255, 255, 218, 143),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color.fromRGBO(110, 110, 110, 1),
                        spreadRadius: -20,
                        blurRadius: 50,
                      )
                    ],
                  ),
                  child: Controls(audioPlayer: player)),
            ],
          ),
      ],
    );
  }
}

class Controls extends StatelessWidget {
  const Controls({super.key, required this.audioPlayer});
  final AudioPlayer audioPlayer;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
        stream: audioPlayer.playerStateStream,
        builder: (context, snapshot) {
          final playerState = snapshot.data;
          final processingState = playerState?.processingState;
          final playin = playerState?.playing;

          if (!(playin ?? false)) {
            return IconButton(
              onPressed: audioPlayer.play,
              icon: const Icon(
                color: Color.fromARGB(255, 52, 52, 52),
                Icons.play_arrow_rounded,
                size: 150,
              ),
            );
          } else if (processingState != ProcessingState.completed) {
            return IconButton(
              onPressed: audioPlayer.pause,
              icon: const Icon(
                color: Color.fromARGB(255, 52, 52, 52),
                Icons.stop_rounded,
                size: 150,
              ),
            );
          }
          return const Icon(
            color: Color.fromARGB(255, 52, 52, 52),
            Icons.play_circle_fill_outlined,
            size: 200,
          );
        });
  }
}

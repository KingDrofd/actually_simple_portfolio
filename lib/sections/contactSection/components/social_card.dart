import 'package:actually_simple_portfolio/utils/check_phone.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialCard extends StatefulWidget {
  const SocialCard({
    super.key,
    this.color = const Color.fromARGB(255, 217, 255, 252),
    this.shadowColor = const Color.fromARGB(255, 142, 255, 246),
    this.image = "assets/placholder.png",
    this.text = "Some Guy",
    this.link = "https://youtu.be/dQw4w9WgXcQ",
  });
  final Color color;
  final Color shadowColor;
  final String image;
  final String text;
  final String link;
  @override
  State<SocialCard> createState() => _SocialCardState();
}

class _SocialCardState extends State<SocialCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isHovered = false;
  late Animation<double> animation;
  late Animation<double> animOffset;
  late Animation<double> shadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    animation = Tween<double>(begin: 0, end: .3)
        .chain(
          CurveTween(curve: Curves.easeInOutCubic),
        )
        .animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    animOffset = Tween<double>(begin: 0, end: -5)
        .chain(
          CurveTween(curve: Curves.easeInOutCubic),
        )
        .animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    shadeAnimation = Tween<double>(begin: 0, end: 1)
        .chain(
          CurveTween(curve: Curves.easeIn),
        )
        .animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return checkPhone(context, size: 1100)
        ? MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) {
              _isHovered = true;
              _animationController.forward();
            },
            onExit: (event) {
              _isHovered = false;
              _animationController.reverse();
            },
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (checkPhone(context) && _isHovered == false) {
                    _isHovered = true;
                    _animationController.forward();
                  } else {
                    _isHovered = false;
                    _animationController.reverse();
                  }
                });
                var uri = Uri.parse(widget.link);
                launchUrl(uri);
              },
              child: Transform.translate(
                offset: Offset(0, animOffset.value),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: widget.color,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: widget.shadowColor
                                .withOpacity(shadeAnimation.value),
                            offset: Offset(0, 20),
                            spreadRadius: -20,
                            blurRadius: 40,
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      widget.image,
                      height: 50,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
            ),
          )
        : MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) {
              _isHovered = true;
              _animationController.forward();
            },
            onExit: (event) {
              _isHovered = false;
              _animationController.reverse();
            },
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (checkPhone(context) && _isHovered == false) {
                    _isHovered = true;
                    _animationController.forward();
                  } else {
                    _isHovered = false;
                    _animationController.reverse();
                  }
                });

                var uri = Uri.parse(widget.link);
                launchUrl(uri);
              },
              child: Transform.translate(
                offset: Offset(0, animOffset.value),
                child: Container(
                  height: 80,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: widget.color,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: widget.shadowColor
                            .withOpacity(shadeAnimation.value),
                        offset: Offset(0, 30),
                        spreadRadius: -30,
                        blurRadius: 40,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Gap(20),
                      Image.asset(
                        widget.image,
                        height: 50,
                        filterQuality: FilterQuality.high,
                      ),
                      Gap(50),
                      Text(
                        widget.text,
                        style: GoogleFonts.quicksand(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
//   Widget icon({double? height}) {
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       onEnter: (event) {
//         _isHovered = true;
//         _animationController.forward();
//       },
//       onExit: (event) {
//         _isHovered = false;
//         _animationController.reverse();
//       },
//       child: GestureDetector(
//         onTap: () {
//           setState(() {
//             if (checkPhone(context) && _isHovered == false) {
//               _isHovered = true;
//               _animationController.forward();
//             } else {
//               _isHovered = false;
//               _animationController.reverse();
//             }
//           });
//         },
//         child: Transform.translate(
//           offset: Offset(0, animOffset.value),
//           child: Container(
//             height: 80,
//             width: 80,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: widget.color,
//               boxShadow: <BoxShadow>[
//                 BoxShadow(
//                   color: widget.shadowColor.withOpacity(shadeAnimation.value),
//                   offset: Offset(0, 20),
//                   spreadRadius: -20,
//                   blurRadius: 40,
//                 ),
//               ],
//             ),
//             child: Image.asset(
//               widget.image,
//               height: height,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

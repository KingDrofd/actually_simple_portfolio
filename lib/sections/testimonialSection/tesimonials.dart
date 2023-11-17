import 'package:actually_simple_portfolio/utils/check_phone.dart';
import 'package:actually_simple_portfolio/widgets/custom_testimonial_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Testimonials extends StatefulWidget {
  const Testimonials({
    super.key,
  });

  @override
  State<Testimonials> createState() => _TestimonialsState();
}

class _TestimonialsState extends State<Testimonials> {
  final PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();

    // Add a listener to the page controller to detect page changes
    _pageController.addListener(() {
      if (_pageController.page == 2) {
        // If the last page is reached, jump back to the first page
        _pageController.animateToPage(
          0,
          duration:
              Duration(milliseconds: 500), // Adjust the duration as needed
          curve: Curves.easeInOut, // Adjust the curve as needed
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 8, right: 8),
      width: 1100,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 5,
                    height: 30,
                    color: Colors.blue,
                  ),
                  Container(
                    color: Colors.black,
                    width: 5,
                    height: 60,
                  )
                ],
              ),
              const Gap(10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Client's Testimonials",
                    style: GoogleFonts.quicksand(
                        fontSize: checkPhone(context, size: 600) ? 15 : 20),
                  ),
                  Text(
                    "Feedback Recieved",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: checkPhone(context, size: 600) ? 30 : 50,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(200),
          Container(
            padding: EdgeInsets.only(left: 8, right: 8),
            height: 350,
            width: 1120,
            child: Stack(
              children: [
                ListView(
                  shrinkWrap: true,
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  children: [
                    CustomTestimonialCard(),
                    Gap(20),
                    CustomTestimonialCard(
                      color: Color.fromARGB(255, 254, 224, 224),
                      shadowColor: Color.fromARGB(255, 255, 183, 183),
                    ),
                    Gap(20),
                    CustomTestimonialCard(
                      color: Color.fromARGB(255, 254, 243, 221),
                      shadowColor: Color.fromARGB(255, 255, 218, 143),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

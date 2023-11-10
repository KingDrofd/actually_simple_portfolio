import 'package:actually_simple_portfolio/widgets/custom_offering_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Offerings extends StatelessWidget {
  const Offerings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1100,
      constraints: const BoxConstraints(maxWidth: 1100),
      height: 600,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 10,
                    height: 20,
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.black,
                    width: 10,
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
                    "My Strong Arenas",
                    style: GoogleFonts.oswald(fontSize: 20),
                  ),
                  Text(
                    "Service Offerings",
                    style: GoogleFonts.oswald(fontSize: 36),
                  ),
                ],
              ),
            ],
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomOfferingCard(
                text: "Web Design",
              ),
              CustomOfferingCard(
                text: "UI Design",
              ),
              CustomOfferingCard(
                text: "Interaction Design",
              ),
              CustomOfferingCard(
                text: "Backend",
              )
            ],
          ),
          const Gap(20)
        ],
      ),
    );
  }
}

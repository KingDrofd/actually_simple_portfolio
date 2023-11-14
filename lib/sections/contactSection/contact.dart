import 'package:actually_simple_portfolio/sections/contactSection/components/social_card.dart';
import 'package:actually_simple_portfolio/utils/check_phone.dart';
import 'package:actually_simple_portfolio/widgets/custom_outlined_button.dart';
import 'package:actually_simple_portfolio/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  const Contact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController subject = TextEditingController();
    TextEditingController budjet = TextEditingController();
    TextEditingController description = TextEditingController();
    double smallFieldWidth = 450;
    if (checkPhone(context, size: 1100)) {
      smallFieldWidth = 350;
    } else if (checkPhone(context, size: 850)) {
      smallFieldWidth = 100;
    }
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      width: 1100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                    color: Colors.purple,
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
                    "For Project Inquiry",
                    style: GoogleFonts.quicksand(
                        fontSize: checkPhone(context, size: 600) ? 15 : 20),
                  ),
                  Text(
                    "Contact Us!",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: checkPhone(context, size: 600) ? 45 : 50,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Gap(100),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Color.fromARGB(148, 75, 68, 255),
                  offset: Offset(0, 0),
                  spreadRadius: 1,
                  blurRadius: 60,
                ),
                // BoxShadow(
                //   color: Color.fromARGB(149, 6, 0, 177),
                //   offset: Offset(0, 80),
                //   spreadRadius: -30,
                //   blurRadius: 60,
                // ),
              ],
            ),
            width: double.maxFinite,
            height: checkPhone(context, size: 900) ? 1050 : 950,
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(20 * 2.5),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SocialCard(
                          text: "LinkedIn",
                          image: "assets/Linkedin-logo.png",
                          link:
                              "https://www.linkedin.com/in/abdellah-regad-509877206/",
                          color: Color.fromARGB(255, 217, 255, 252),
                          shadowColor: Color.fromARGB(255, 67, 255, 239),
                        ),
                        SocialCard(
                          text: "Discord",
                          image: "Discord-Emblem.png",
                          link:
                              "https://www.discordapp.com/users/430135831051763714",
                          color: Color.fromARGB(255, 214, 220, 255),
                          shadowColor: Color(0xFF5166F6),
                        ),
                        SocialCard(
                          color: Color.fromARGB(255, 215, 215, 215),
                          shadowColor: const Color.fromARGB(255, 61, 61, 61),
                          text: "GitHub",
                          image: "github-mark.png",
                          link: "https://github.com/KingDrofd",
                        ),
                      ],
                    ),
                    const Gap(50),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 20 * 2.5,
                      runSpacing: 20 * 2.5,
                      children: [
                        SizedBox(
                          width: smallFieldWidth,
                          child: TextFormField(
                            controller: name,
                            decoration: buildFormFieldDeco(
                                label: "Your Name", hint: "Enter your name"),
                          ),
                        ),
                        SizedBox(
                          width: smallFieldWidth,
                          child: TextFormField(
                            controller: email,
                            decoration: buildFormFieldDeco(
                                label: "Email Adress",
                                hint: "Enter your email address"),
                          ),
                        ),
                        SizedBox(
                          width: smallFieldWidth,
                          child: TextFormField(
                            controller: subject,
                            decoration: buildFormFieldDeco(
                                label: "Project Type",
                                hint: "Enter the project type"),
                          ),
                        ),
                        SizedBox(
                          width: smallFieldWidth,
                          child: TextFormField(
                            controller: budjet,
                            decoration: buildFormFieldDeco(
                                label: "Project Budjet",
                                hint: "Enter project budget"),
                          ),
                        ),
                        SizedBox(
                          width: checkPhone(context, size: 900) ? 350 : 950,
                          child: TextFormField(
                            controller: description,
                            maxLines: checkPhone(context, size: 900) ? 10 : 16,
                            decoration: buildFormFieldDeco(
                                vPad: 30,
                                label: "Project Description",
                                hint: "Write a description of the project"),
                          ),
                        ),
                      ],
                    ),
                    const Gap(29),
                    CustomTextButton(
                      imageSrc: "assets/icons/letter.png",
                      press: () {
                        String? encodeQueryParameters(
                            Map<String, String> params) {
                          return params.entries
                              .map((MapEntry<String, String> e) =>
                                  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                              .join('&');
                        }

                        final Uri emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: 'fromgames.dev@gmail.com',
                          query: encodeQueryParameters(<String, String>{
                            'subject': subject.text,
                            'body': 'Name: ${name.text}\nEmail: ${email.text}'
                                '\nProject: ${subject.text}\n'
                                'Budget: ${budjet.text}\n\n'
                                'Description: ${description.text}.',
                          }),
                        );
                        launchUrl(emailLaunchUri);
                      },
                      text: "Send",
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration buildFormFieldDeco(
      {String? label = "Label", String? hint = "Hint", double vPad = 30}) {
    return InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: GoogleFonts.quicksand(),
        labelStyle: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0), // Set the border radius
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 198, 224, 255),
            width: 1.0, // Set the border width
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0), // Set the border radius
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 175, 222, 255),

            width: 2.0, // Set the border width when focused
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: vPad, horizontal: 45.0),
        floatingLabelBehavior: FloatingLabelBehavior.always);
  }
}

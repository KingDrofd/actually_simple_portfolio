import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedIndex = 0;
  int hoverIndex = -1;

  List<String> menuItems = [
    "Home",
    "About",
    "Services",
    "Portfolio",
    "Testimonial",
    "Contact"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1110),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      height: 100,
      decoration: _buildBoxDeco(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          menuItems.length,
          (index) => buildMenuItem(index),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDeco() {
    return const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(
          offset: const Offset(0, 40),
          spreadRadius: -80,
          color: const Color.fromARGB(100, 6, 0, 177),
          blurRadius: 50,
        ),
        // BoxShadow(
        //   offset: const Offset(0, 40),
        //   spreadRadius: -80,
        //   color: Color.fromARGB(44, 0, 0, 0),
        //   blurRadius: 50,
        // ),
      ],
    );
  }

  Widget buildMenuItem(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = hoverIndex;
        });
      },
      onHover: (value) {
        setState(() {
          value ? hoverIndex = index : hoverIndex = selectedIndex;
        });
      },
      child: _buildHoverAnimaion(index),
    );
  }

  Container _buildHoverAnimaion(int index) {
    return Container(
      constraints: const BoxConstraints(minWidth: 122),
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            menuItems[index],
            style: TextStyle(
              fontFamily: "Spotify",
              letterSpacing: -1.5,
              fontSize: 20,
              color: Color.fromRGBO(70, 70, 100, 1),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: 0,
            right: 0,
            bottom: selectedIndex != index && hoverIndex == index ? -20 : -32,
            child: Image.asset("assets/hover.png"),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: 0,
            right: 0,
            bottom: selectedIndex == index ? -2 : -32,
            child: Image.asset("assets/hover.png"),
          ),
        ],
      ),
    );
  }
}

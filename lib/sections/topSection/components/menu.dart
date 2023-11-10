import 'package:flutter/material.dart';

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
    return BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(
          offset: const Offset(0, 50),
          spreadRadius: -100,
          color: const Color.fromARGB(255, 6, 0, 177).withOpacity(0.15),
          blurRadius: 50,
        ),
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
            style: const TextStyle(
              fontSize: 20,
              color: Colors.blueGrey,
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

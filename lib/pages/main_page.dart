import 'package:actually_simple_portfolio/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                Container(
                  width: double.maxFinite,
                  height: 900,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/background.jpg",
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: 1000,
                ),
                Container(
                  width: double.maxFinite,
                  height: 1000,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/backgroun2.png",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Gap(201),
                const CustomContainer(
                  width: 1100,
                  height: 500,
                  blur: 15,
                  radius: 5,
                  borderWidth: 0,
                  colorOpacity: .1,
                  child: Center(
                    child: Text("Hello World! \nThis Is A Test"),
                  ),
                ),
                Gap(100),
                Container(
                  width: 1100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0, 50),
                        spreadRadius: -100,
                        color: Color.fromARGB(255, 6, 0, 177).withOpacity(.15),
                        blurRadius: 50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

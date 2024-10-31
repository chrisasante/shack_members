import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shack_member_directory/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const colorizeColors = [
    primaryColor,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'WELCOME TO SHACK15',
                  textStyle: const TextStyle(
                      fontSize: 50.0,
                      fontFamily: 'Horizon',
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  colors: colorizeColors,
                ),
              ],
              isRepeatingAnimation: true,
            ),
            SizedBox(
              height: deviceHeight(context) * 0.1,
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/members_list');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                side: const BorderSide(
                  color: primaryColor,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                minimumSize: const Size(115, 50),
              ),
              child: const Text(
                "View All Members",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

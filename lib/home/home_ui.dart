import 'package:flutter/material.dart';
import 'package:modern_smart_home_ui/utils/smart_device_box.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  // Padding components
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  List mySmartDevice = [
    ["Smart Light", 'lib/images/light.webp', true],
    ["Smart Ac", 'lib/images/ac.webp', false],
    ["Smart Tv", 'lib/images/tv.webp', false],
    ["Smart Fan", 'lib/images/fan.webp', true],
  ];

  void powerSwitchChange(bool value, int index) {
    setState(() {
      mySmartDevice[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'lib/images/four.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),

            // Space
            const SizedBox(height: 20),

            // Welcome text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Welcome Home"),
                  Text(
                    "Haileamlak Waleligne",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),

            // Space
            const SizedBox(height: 20),

            // Smart home UI
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const Text("Smart Devices"),
            ),

            // GridView
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  childAspectRatio: 1 / 1.3,
                ),
                itemCount: mySmartDevice
                    .length, // Replace with the number of items you want
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevice[index][0],
                    iconPath: mySmartDevice[index][1],
                    powerOn: mySmartDevice[index][2],
                    onChanged: (value) => powerSwitchChange(value, index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

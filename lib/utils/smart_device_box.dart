// import 'dart:ffi';
// import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;

  // Void Function(bool)? onChanged;

  SmartDeviceBox({
    super.key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        // padding: EdgeInsets.only(left: 1),
        decoration: BoxDecoration(
            color: powerOn ? Colors.grey[200] : Colors.black,
            borderRadius: BorderRadius.circular(24)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              iconPath,
              height: 65,
              color: powerOn ? Colors.grey[800] : Colors.grey[200],
            ),
            Column(
              children: [
                Text(
                  smartDeviceName,
                  style: TextStyle(
                    fontSize: 16, // Slightly larger font for better readability
                    fontWeight: FontWeight.bold, // Bold text for emphasis
                    color: powerOn ? Colors.black : Colors.grey[200],
                    letterSpacing: 1.0, // Adds spacing between characters
                    shadows: [
                      Shadow(
                        color: powerOn
                            ? Colors.grey
                            : Colors.white.withOpacity(0.5),
                        offset: Offset(1, 1), // Slight shadow for depth
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
                CupertinoSwitch(
                  value: powerOn,
                  onChanged: onChanged,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

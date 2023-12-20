// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:math';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:timer/ui/colors.dart';
import 'package:intl/intl.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int time = 25;
  int breakTime = 5;
  Timer? timer;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(24),
        child: MoveWindow(
          child: AppBar(
            actions: [
              Transform.scale(
                scale: 1,
                child: MinimizeWindowButton(),
              ),
              Transform.scale(
                scale: 1,
                child: CloseWindowButton(),
              ),
            ],
            // elevation: 0.0,
            backgroundColor: AppColor.primaryColor,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //make center for entire items
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
          Text(
            "25:00",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              // backgroundColor: AppColor.secondaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RawMaterialButton(
                  fillColor: AppColor.secondaryColor,
                  onPressed: () {},
                  child: Text(
                    "Start",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {},
                  fillColor: Colors.red,
                  child: Text(
                    "Stop",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

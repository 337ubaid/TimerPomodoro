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
            backgroundColor: AppColor.secondaryColor,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 268,
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
        ],
      ),
    );
  }
}

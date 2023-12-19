import 'dart:async';
import 'dart:math';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:timer/ui/colors.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Setting the app variables
  int time = 25;
  int breakTime = 5;
  Timer? timer;
  int counter = 25 * 60;

  /* setting the start function */
  void startTimer(int timeInMinutes) {
    counter = timeInMinutes * 60;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (counter > 0) {
          counter--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: MoveWindow(
            child: AppBar(
              // actions: [
              //   Transform.scale(
              //     scale: 1,
              //     child: MinimizeWindowButton(),
              //   ),
              //   Transform.scale(
              //     scale: 0.8,
              //     child: CloseWindowButton(),
              //   ),
              // ],
              elevation: 0.0,
              backgroundColor: AppColor.primaryColor,
              centerTitle: true,
              title: Text(
                '${DateFormat('EEEE\ndd MMM yyyy').format(DateTime.now().add(Duration(hours: 7)))}',
                style: TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),

        /* Setting the Body of the app */
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${counter ~/ 60 < 10 ? "0" + (counter ~/ 60).toString() : counter ~/ 60}:${counter % 60 < 10 ? "0" + (counter % 60).toString() : counter % 60}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: max(64, MediaQuery.of(context).size.width / 8)),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RawMaterialButton(
                  onPressed: () {
                    //Setting the Start Button Function
                    setState(() {
                      if (timer != null) {
                        timer!.cancel();
                      }
                    });
                    startTimer(25);
                  },
                  fillColor: AppColor.secondaryColor,
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  shape: StadiumBorder(),
                  child: Text(
                    "Start",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                RawMaterialButton(
                  onPressed: () {
                    //Setting the Break Button Function
                    setState(() {
                      if (timer != null) {
                        timer!.cancel();
                      }
                    });
                    startTimer(5);
                  },
                  fillColor: AppColor.secondaryColor,
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  shape: StadiumBorder(),
                  child: Text(
                    "Break",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
            StreamBuilder<DateTime>(
              stream:
                  Stream.periodic(Duration(seconds: 1), (_) => DateTime.now()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final currentTime = snapshot.data!;
                  final formattedTime = DateFormat.Hms().format(currentTime);
                  return Text(
                    formattedTime,
                    style: TextStyle(
                      color: AppColor.secondaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else {
                  return Text(
                    'Loading...',
                    style: TextStyle(
                      color: AppColor.secondaryColor,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
              },
            ),
          ],
        ));
  }
}

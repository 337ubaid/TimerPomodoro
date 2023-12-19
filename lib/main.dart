import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:timer/screens/home_screen.dart';
import 'package:timer/screens/timer_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    final initialSize = Size(268, 80);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.topLeft;
    win.title = "";
    win.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer App',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: const TimerScreen(),
      // home: const HomeScreen(),
    );
  }
}

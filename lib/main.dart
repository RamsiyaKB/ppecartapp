import 'dart:async';




import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'homesc.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:  ThemeData(scaffoldBackgroundColor: Colors.white),
      home: splashh(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class splashh extends StatefulWidget {
  const splashh({super.key});

  @override
  State<splashh> createState() => _splashhState();
}

class _splashhState extends State<splashh> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                HomeScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 104,
            width: 104,
            child: SvgPicture.asset(
                "assets/images/logo.svg",
                semanticsLabel: 'Acme Logo'
            ),
            ),
        
      ),
    );
  }
}

import 'dart:async';




import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppecartapp/Login.dart';

import 'homesc.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBgswRrPP7tdyj9wH4FWf7bcjKi4gh6X94",
      appId: "1:656850317677:android:ff3b2737b022c6e9b56a64",
      messagingSenderId: "656850317677",
      projectId: "loginpagee-a8210",
    ),
  );
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
                LoginPage()
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:sign_in_button/sign_in_button.dart';

import 'homesc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential authResult =
      await _auth.signInWithCredential(credential);
      final User? user = authResult.user;
      return user;
    } catch (error) {
      print("Error during Google sign-in: $error");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [ SizedBox(height: 100,),
          SvgPicture.asset("assets/images/splsh.svg",
              semanticsLabel: 'Acme Logo'),
          SizedBox(height: 100,),

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 220),
                child: Text("Let's Begin",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,

                      fontSize: 22.0,
                    )),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              child: Text('Login with your google account to continue journey to world of Electronics gadgets ',
                  style: GoogleFonts.poppins(

                    fontSize: 14.0,
                  )),
            ),
          ),
          SizedBox(height: 50,),
          SignInButton(
            Buttons.google,
            text: " Continue with Google",
            onPressed: () async {
              User? user = await _handleSignIn();
              print('dataaaaaaaaaaaaaa${user!.displayName.toString()}');
              if (user != null) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              }
            },
          )],
      ),
    );
  }
}

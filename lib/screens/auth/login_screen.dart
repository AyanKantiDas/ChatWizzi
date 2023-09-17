import 'dart:io';

import 'package:ayanchat/helper/dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';

import '../../api/apis.dart';
import '../../main.dart';
import '../../utils/media.dart';
import '../home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isAnimate = false;
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isAnimate = true;
      });
    });
  }

  _handleGoogleButtonClick() {
    Dialogs.showProgresskBar(context);
    _signInWithGoogle().then((user) async {
      Navigator.pop(context);
      if (user != null) {
        print("\nUser: ${user.user}");
        print("\nUserAdittionalInfo: ${user.additionalUserInfo}");

        if (await APIs.userExists()) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => HomeScreen()));
        } else {
          APIs.createUser().then((value) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => HomeScreen()));
          });
        }
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    } catch (e) {
      print("\n_signInWithGoogle: $e");
      Dialogs.showSnackBar(context, "Something went wrong! Check Internet");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    final size = AppLayout.getSize(context);
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
              top: AppLayout.getHeight(50),
              width: AppLayout.getScreenWidth(),
              left: _isAnimate
                  ? AppLayout.getWidth(.5)
                  : -AppLayout.getScreenWidth(),
              duration: Duration(seconds: 3),
              child: Image.asset("assests/images/chat.png")),
          AnimatedPositioned(
              top: AppLayout.getHeight(350),
              width: mq.width * .5,
              right: _isAnimate ? AppLayout.getWidth(100) : -mq.width * .5,
              duration: Duration(seconds: 3),
              child: Image.asset("assests/images/chatwizziprofile1.png")),
          Positioned(
            bottom: mq.height * .15,
            width: mq.width * .9,
            left: mq.width * .05,
            height: mq.height * .07,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: StadiumBorder(),
                  elevation: 3),
              onPressed: () {
                _handleGoogleButtonClick();
              },
              icon: Image.asset("assests/images/Googlelogo.png",
                  height: mq.height * .06),
              label: RichText(
                text: TextSpan(
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  children: [
                    TextSpan(text: "Login with "),
                    TextSpan(
                        text: "Google",
                        style: TextStyle(fontStyle: FontStyle.italic))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

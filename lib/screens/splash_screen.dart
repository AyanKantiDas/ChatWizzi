import 'package:ayanchat/api/apis.dart';
import 'package:ayanchat/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';
import '../utils/media.dart';
import 'auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1500), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          systemNavigationBarColor: Colors.white));

      if (APIs.auth.currentUser != null) {
        print("\nUser: ${APIs.auth.currentUser}");
        print("\nUserAdittionalInfo: ${APIs.auth.currentUser}");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    final size = AppLayout.getSize(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: AppLayout.getHeight(215),
            width: AppLayout.getWidth(190),
            right: AppLayout.getWidth(65),
            child: Image.asset("assests/images/arrow1.png"),
          ),
          Positioned(
            top: AppLayout.getHeight(50),
            width: AppLayout.getScreenWidth(),
            right: AppLayout.getWidth(10),
            child: Image.asset("assests/images/bell.png"),
          ),
          Positioned(
            top: AppLayout.getHeight(510),
            width: AppLayout.getWidth(300),
            right: AppLayout.getWidth(20),
            child: Text(
              "❤ Connect, chat, and share your thoughts instantly with our user-friendly and secure chat app. Stay connected, always! ❤",
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}

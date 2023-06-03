import 'dart:async';
import 'package:flutter/material.dart';
import './login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Route route = MaterialPageRoute(builder: (context) => const LoginPage());
      Navigator.pushReplacement(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Background_1.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Center(
            child: Image.asset(
              'assets/images/Logo_1.png',
              width: 200.0,
              height: 200.0,
            ),
          )
        ],
      ),
    );
  }
}

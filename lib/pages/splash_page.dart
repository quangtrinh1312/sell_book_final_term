import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sell_book_final_term/pages/home_page.dart';
import './login_page.dart';
import '../services/local/shared_prefs_splash.dart';
import '../models/splash.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SharedPrefsSplash _prefsSplash = SharedPrefsSplash();
  List<Splash>? isLogedList;
  @override
  void initState() {
    super.initState();
    _getIsLoged();
    Timer(const Duration(seconds: 2), () {
      if(isLogedList!.first.loged == false){
        Route route = MaterialPageRoute(builder: (context) => const LoginPage());
      Navigator.pushReplacement(context, route);
      }else{
         Route route = MaterialPageRoute(builder: (context) =>  HomePage(username: isLogedList!.first.username!,));
      Navigator.pushReplacement(context, route);
      }
      
    });
  }

  _getIsLoged(){
    _prefsSplash.getIsloged().then((value) {
      isLogedList = value ?? islogedInitList;
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

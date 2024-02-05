import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ride_share_app/constants/color.dart';

import 'auth_screen.dart/auth_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  _navigatertohome() async {
    await Future.delayed(const Duration(seconds: 4), () {

      Get.offAll(() => const LoginScreen());
    });
  }

  @override
  void initState() {
    _navigatertohome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimarColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: Get.height/5.4,),
             // Adjust the height as needed
            const AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 500),
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
              child: Text('Ride Share App'),
            ),
            Lottie.asset('assets/car_animation.json', height: 400, width: 400),
          
          ],
        ),
      ),
    );
  }
}

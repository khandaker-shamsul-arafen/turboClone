import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:turbo_coone1/consts/consts.dart';
import 'package:turbo_coone1/views/screens/parent_screen.dart';

import '../../utils/helpers.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    var value = readStorage('firstTime');
    dd(value);
    Future.delayed(const Duration(seconds: 5), () {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (value == null) {
          writeStorage('firstTime', true);
          Get.offAll(() {
            return const OnboardingScreen();
          });
        } else {
          Get.offAll(() {
            return const ParentScreen();
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/splash.png'),
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "LIVESCORE - NEWS -STATS",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: AppSizes.size22),
              ),
              SizedBox(
                height: AppSizes.newSize(20),
              ),
              Padding(
                padding: EdgeInsets.only(right: AppSizes.newSize(10)),
                child: Image.asset('assets/images/splash_logo.png'),
              )
            ]),
      ),
    );
  }
}

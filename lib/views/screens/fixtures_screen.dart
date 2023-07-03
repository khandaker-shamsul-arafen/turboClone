// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';
import '../../consts/app_widget.dart';
import '../widgets/allLeaguesWidget.dart';
import '../widgets/home_page_container.dart';

class FixtureScreen extends StatefulWidget {
  const FixtureScreen({super.key});

  @override
  State<FixtureScreen> createState() => _FixtureScreenState();
}

class _FixtureScreenState extends State<FixtureScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Container(
            width: Get.width,
            height: AppSizes.newSize(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.gradientStart,
                  AppColors.gradientEnd,
                  AppColors.gradientStart
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: AppSizes.newSize(2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const HomePageContainer(
                    date: 'JUL 12',
                    day: 'SUN',
                  ),
                  SizedBox(
                    width: AppSizes.newSize(.8),
                  ),
                  const HomePageContainer(
                    date: 'JUL 13',
                    day: 'TODAY',
                    selected: true,
                  ),
                  SizedBox(
                    width: AppSizes.newSize(.8),
                  ),
                  const HomePageContainer(
                    date: 'JUL 4',
                    day: 'TUE',
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: AppSizes.newSize(1)),
                    child: Icon(
                      Icons.calendar_month_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: AppSizes.newSize(0.5),
                        left: AppSizes.newSize(0.2)),
                    child: Container(
                      height: Get.height * 0.045,
                      width: AppSizes.newSize(15),
                      margin: EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: AppColors.dateContainerColor,
                      ),
                      child: Center(
                        child: ListTile(
                          contentPadding: EdgeInsets.only(
                            left: 9,
                            right: 5,
                            top: 0,
                            bottom: 0,
                          ),
                          dense: true,
                          leading: Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: const Text(
                              "ALL LEAGUES",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          trailing: Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: AppSizes.newSize(-2),
            left: AppSizes.newSize(6),
            child: ClipPath(
              clipper: MyCustomClipper(),
              child: Container(
                height: AppSizes.newSize(7),
                width: AppSizes.newSize(8),
                color: Colors.amber,
                child: Padding(
                  padding: EdgeInsets.only(bottom: AppSizes.newSize(0.6)),
                  child: Align(
                      alignment: Alignment.bottomCenter, child: Text("Live")),
                ),
              ),
            ),
          )
        ])
      ],
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, 0.0);
    path.lineTo(size.width * 0.1, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.9, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

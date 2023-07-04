// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbo_coone1/views/screens/fixtures_details.dart';
import 'package:turbo_coone1/views/screens/league_details.dart';

import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';

import '../widgets/allLeaguesWidget.dart';
import '../widgets/home_page_container.dart';
import '../widgets/leagueNameWidget.dart';

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
        Stack(
          children: [
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
                padding: EdgeInsets.only(
                    bottom: AppSizes.newSize(2), left: AppSizes.newSize(1)),
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
                        size: AppSizes.newSize(4),
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
                              left: AppSizes.newSize(0.8),
                              right: AppSizes.newSize(0.5),
                            ),
                            dense: true,
                            visualDensity:
                                VisualDensity(horizontal: -4, vertical: -4),
                            leading: Text(
                              "ALL LEAGUES",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppSizes.size14),
                            ),
                            trailing: Padding(
                              padding:
                                  EdgeInsets.only(bottom: AppSizes.newSize(0)),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                size: AppSizes.newSize(3),
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
              top: AppSizes.newSize(-3),
              left: AppSizes.newSize(6),
              child: ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                  height: AppSizes.newSize(7),
                  width: AppSizes.newSize(8),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: AppSizes.newSize(1)),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "LIVE",
                          style: TextStyle(
                              fontSize: AppSizes.size16,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ),
            )
          ],
        ),
        Expanded(
            child: ListView(
          children: [
            ...List.generate(10, (i) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => LeagueDetailsScreen());
                    },
                    child: LeagueNameWidget(
                      ligueImage:
                          "https://cdn.sportmonks.com/images/soccer/leagues/29/989.png",
                      ligueText: "CHAMPION",
                      ligueCountry: "BANGLADESH",
                    ),
                  ),
                  ...List.generate(2, (i) {
                    return GestureDetector(
                      onTap: () {
                        FixturesDetailsScreen();
                      },
                      child: AllLeaguesWidget(
                          teamImage1:
                              "https://cdn.sportmonks.com/images/countries/png/short/ua.png",
                          teamImage2:
                              "https://cdn.sportmonks.com/images/countries/png/short/ua.png",
                          teamName1: "Al Naser",
                          teamName2: "Miami",
                          state: " NS",
                          score1: "0",
                          score2: "1"),
                    );
                  }),
                ],
              );
            })
          ],
        )),
      ],
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, 0.0);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(size.width, size.height * 0.8);
    path.lineTo(size.width * 0.8, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

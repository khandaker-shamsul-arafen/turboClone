import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '/consts/consts.dart';

class AllLeaguesWidget extends StatelessWidget {
  final String teamImage1;
  final String teamImage2;
  final String teamName1;
  final String teamName2;
  final String state;
  final String score1;
  final String score2;
  final String time;
  final bool live;
  final bool goals;
  final bool recentMatches;

  const AllLeaguesWidget({
    super.key,
    required this.teamImage1,
    required this.teamImage2,
    required this.teamName1,
    required this.teamName2,
    required this.state,
    this.score1 = "",
    this.score2 = "",
    this.time = '',
    this.live = false,
    this.goals = true,
    this.recentMatches = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppSizes.newSize(.2),
          width: Get.width,
        ),
        SizedBox(
          //width: Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: ClipPath(
                  clipper: MyCustomClipper(),
                  child: Container(
                    width: Get.width * 0.40,
                    height: Get.height * 0.065,
                    color: AppColors.fixtureContainerBackground,
                    child: Center(
                      child: ListTile(
                        visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -4),
                        dense: true,
                        contentPadding: EdgeInsets.only(
                            left: AppSizes.newSize(1), right: 0.0),
                        leading: Container(
                          height: AppSizes.newSize(60),
                          width: Get.width * 0.1,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(teamImage1))),
                        ),
                        title: Text(
                          teamName1,
                          style: TextStyle(
                              fontSize: AppSizes.size13,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ClipPath(
                  clipper: MyCustomClipper2(),
                  child: Container(
                    height: Get.height * 0.065,
                    // width: Get.width * 0.18,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.gradientStart,
                          AppColors.gradientEnd,
                          AppColors.gradientStart
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Visibility(
                          visible: goals,
                          child: Text(
                            "$score1 - $score2",
                            style: TextStyle(
                                color: Colors.white, fontSize: AppSizes.size18),
                          ),
                        ),
                        Visibility(
                          visible: goals == false,
                          child: Text(
                            time,
                            style: TextStyle(
                                color: Colors.white, fontSize: AppSizes.size18),
                          ),
                        ),
                        Container(
                          color: AppColors.dateContainerColor,
                          child: Text(
                            state,
                            style: TextStyle(
                                color: (live) ? Colors.red : Colors.white,
                                fontSize: AppSizes.size12,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ClipPath(
                  clipper: MyCustomClipper3(),
                  child: Container(
                    width: Get.width * 0.416,
                    height: Get.height * 0.065,
                    color: AppColors.fixtureContainerBackground,
                    child: Center(
                      child: ListTile(
                        visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -4),
                        dense: true,
                        contentPadding: EdgeInsets.only(
                            left: AppSizes.newSize(1.6), right: 0.0),
                        leading: Container(
                          height: AppSizes.newSize(60),
                          width: Get.width * 0.1,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(teamImage2))),
                        ),
                        title: Text(
                          teamName2,
                          style: TextStyle(
                              fontSize: AppSizes.size13,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: AppSizes.newSize(.3),
          width: Get.width,
        ),
      ],
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, 0.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.98, 0.0);
    path.lineTo(0.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class MyCustomClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, 0.0);
    path.lineTo(0.05 * size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.95, 0.0);
    path.lineTo(0.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class MyCustomClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, 0.0);
    path.lineTo(0.02 * size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

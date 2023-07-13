import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
import 'package:turbo_coone1/models/fixture_details.dart';
import 'package:turbo_coone1/utils/helpers.dart';
import '/consts/consts.dart';

class FixtureWidget extends StatelessWidget {
  final FixtureData fixture;

  final bool recentMatches;

  const FixtureWidget(
    this.fixture, {
    super.key,
    this.recentMatches = false,
  });

  @override
  Widget build(BuildContext context) {
    String team1Image = fixture.participants?[0].imagePath ?? '';
    String team2Image = fixture.participants?[1].imagePath ?? '';
    String team1Name = fixture.participants?[0].name ?? '';
    String team2Name = fixture.participants?[1].name ?? '';
    String state = fixture.state?.shortName ?? '';
    String time = DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(
        (fixture.startingAtTimestamp ?? 0) * 1000));
    bool goal =
        (fixture.scores == null || fixture.scores!.isEmpty) ? false : true;
    bool live =
        (fixture.scores == null || fixture.scores!.isEmpty) ? false : true;
    String? score1, score2;
    if (live) {
      dd(fixture.scores);
      //TODO korte hobe
      score1 =
          "${(fixture.participants?[0].id == fixture.scores?[1].participantId) ? (fixture.scores?[1].score?.goals) : '0'}";
      score2 =
          "${(fixture.participants?[1].id == fixture.scores?[1].participantId) ? (fixture.scores?[3].score?.goals) : '0'}";
    }
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
                                  image: NetworkImage(team1Image))),
                        ),
                        title: Text(
                          team1Name,
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
                          visible: goal,
                          child: Text(
                            "$score1 - $score2",
                            style: TextStyle(
                                color: Colors.white, fontSize: AppSizes.size18),
                          ),
                        ),
                        Visibility(
                          visible: goal == false,
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
                                  image: NetworkImage(team2Image))),
                        ),
                        title: Text(
                          team2Name,
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

// ignore_for_file: prefer_const_constructors

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '/utils/helpers.dart';
import '/views/screens/fixtures_details.dart';
import '/views/screens/league_details.dart';

import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';

import '../../controllers/fixture_controller.dart';
import '../../models/fixture_details.dart';
import '../widgets/all_leagues_widget.dart';
import '../widgets/home_page_container.dart';
import '../widgets/league_name_widget.dart';

class FixtureScreen extends StatefulWidget {
  const FixtureScreen({super.key});

  @override
  State<FixtureScreen> createState() => _FixtureScreenState();
}

class _FixtureScreenState extends State<FixtureScreen> {
  FixtureController fixturesController = Get.put(FixtureController());

  @override
  void initState() {
    super.initState();
    fixturesController.loadScheudle();
    fixturesController.liveScheudle();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Obx(
              () => Container(
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
                      GestureDetector(
                        onTap: () {
                          if (!fixturesController.loading.value) {
                            fixturesController.showLive.value = false;
                            fixturesController.selectedDate.value =
                                fixturesController.selectedDate.value
                                    .subtract(Duration(days: 1));
                            fixturesController.loadScheudle();
                          }
                        },
                        child: HomePageContainer(
                          date:
                              '${DateFormat("MMMM").format(fixturesController.selectedDate.value.subtract(Duration(days: 1))).toString()}  ${DateFormat("d").format(fixturesController.selectedDate.value.subtract(Duration(days: 1))).toString()}',
                          day: DateFormat("EEE")
                              .format(fixturesController.selectedDate.value
                                  .subtract(Duration(days: 1)))
                              .toString(),
                        ),
                      ),
                      SizedBox(
                        width: AppSizes.newSize(.8),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: HomePageContainer(
                          date:
                              '${DateFormat("MMM").format(fixturesController.selectedDate.value).toString()}  ${DateFormat("d").format(fixturesController.selectedDate.value)}',
                          day: DateFormat("EEE")
                              .format(fixturesController.selectedDate.value)
                              .toString(),
                          selected: true,
                        ),
                      ),
                      SizedBox(
                        width: AppSizes.newSize(.8),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!fixturesController.loading.value) {
                            fixturesController.showLive.value = false;
                            fixturesController.selectedDate.value =
                                fixturesController.selectedDate.value
                                    .add(Duration(days: 1));
                            fixturesController.loadScheudle();
                          }
                        },
                        child: HomePageContainer(
                          date:
                              '${DateFormat("MMMM").format(fixturesController.selectedDate.value.add(Duration(days: 1))).toString()}  ${DateFormat("d").format(fixturesController.selectedDate.value.add(Duration(days: 1))).toString()}',
                          day: DateFormat("EEE")
                              .format(fixturesController.selectedDate.value
                                  .add(Duration(days: 1)))
                              .toString(),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(bottom: AppSizes.newSize(1)),
                        child: GestureDetector(
                          onTap: () {
                            fixturesController.showLive.value = false;
                            datePicker(
                              initialDate:
                                  fixturesController.selectedDate.value,
                              onChange: (DateTime date) {
                                fixturesController.selectedDate.value = date;
                                //  DateFormat("yyyy-MM-dd").format(DateTime.now()).toString()
                                fixturesController.loadScheudle();
                              },
                            );
                          },
                          child: Icon(
                            Icons.calendar_month_rounded,
                            color: Colors.white,
                            size: AppSizes.newSize(4),
                          ),
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
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: const Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Select Item',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: fixturesController.group
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                  .toList(),
                              value: fixturesController.selectedValue.value,
                              onChanged: (String? value) {
                                fixturesController
                                    .getLeagueFixture(value ?? '');
                                // fixturesController.selectedValue.value =
                                //     value ?? "";
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 50,
                                width: 160,
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                    color: Colors.black26,
                                  ),
                                  color: AppColors.dateContainerColor,
                                ),
                                elevation: 2,
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                ),
                                iconSize: 14,
                                iconEnabledColor: Colors.white,
                                iconDisabledColor: Colors.grey,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: AppColors.dateContainerColor,
                                ),
                                offset: const Offset(-20, 0),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness:
                                      MaterialStateProperty.all<double>(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: AppSizes.newSize(-3),
              left: AppSizes.newSize(6),
              child: GestureDetector(
                onTap: () {
                  fixturesController.showLive.value =
                      !fixturesController.showLive.value;
                },
                child: ClipPath(
                  clipper: MyCustomClipper(),
                  child: Obx(
                    () => Container(
                      height: AppSizes.newSize(7),
                      width: AppSizes.newSize(8),
                      color: (fixturesController.showLive.value)
                          ? Colors.red
                          : Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: AppSizes.newSize(1)),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "LIVE",
                              style: (fixturesController.showLive.value)
                                  ? TextStyle(
                                      fontSize: AppSizes.size16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)
                                  : TextStyle(
                                      fontSize: AppSizes.size16,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Obx(() {
          if (fixturesController.loading.value) {
            return CircularProgressIndicator();
          }
          if (fixturesController.leagueGroup.isEmpty) {
            return SizedBox(
              child: Center(
                child: Text(""),
              ),
            );
          }
          dd(fixturesController.showLive.value);

          return Expanded(
            child: ListView(
              children: [
                (fixturesController.showLive.value)
                    ? (fixturesController.selectedLeagueLive.isEmpty)
                        ? Center(child: Text('No Live Match'))
                        : Column(
                            children: [
                              ...fixturesController.selectedLeagueLive.entries
                                  .map(
                                (entry) => Column(
                                  children: [
                                    Builder(builder: (context) {
                                      League? league = entry.value.first.league;

                                      return GestureDetector(
                                        onTap: () {
                                          Get.to(() => LeagueDetailsScreen(
                                                leagueId: league?.id ?? 0,
                                                imagePath:
                                                    league?.imagePath ?? '',
                                                leagueCountry:
                                                    league?.country?.name ?? '',
                                                leagueName: league?.name ?? '',
                                              ));
                                        },
                                        child: LeagueNameWidget(
                                          ligueImage: "${league?.imagePath}",
                                          ligueText: "${league?.name}",
                                          ligueCountry:
                                              "${league?.country?.name}",
                                        ),
                                      );
                                    }),
                                    ...entry.value.map(
                                      (e) => GestureDetector(
                                        onTap: () {
                                          Get.to(() => FixturesDetailsScreen());
                                        },
                                        child: (e.scores == null ||
                                                e.scores!.isEmpty)
                                            ? AllLeaguesWidget(
                                                teamImage1:
                                                    "${e.participants?[0].imagePath}",
                                                teamImage2:
                                                    "${e.participants?[1].imagePath}",
                                                teamName1:
                                                    "${e.participants?[0].name}",
                                                teamName2:
                                                    "${e.participants?[1].name}",
                                                state: "${e.state?.shortName}",
                                                goals: false,
                                                time: DateFormat.Hm().format(DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                        (e.startingAtTimestamp ??
                                                                0) *
                                                            1000)),
                                              )
                                            : AllLeaguesWidget(
                                                teamImage1:
                                                    "${e.participants?[0].imagePath}",
                                                teamImage2:
                                                    "${e.participants?[1].imagePath}",
                                                teamName1:
                                                    "${e.participants?[0].name}",
                                                teamName2:
                                                    "${e.participants?[1].name}",
                                                state:
                                                    "${e.periods?.firstWhereOrNull((i) => i.ticking == true)?.minutes ?? '-'}",
                                                score1:
                                                    "${e.scores?[0].score?.goals}",
                                                score2:
                                                    "${e.scores?[1].score?.goals}",
                                                live: true,
                                              ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                    : Column(
                        children: [
                          ...fixturesController.selectedLeague.entries.map(
                            (entry) => Column(
                              children: [
                                Builder(builder: (context) {
                                  //   dd(entry);
                                  //dd(entry.value[0].league);
                                  League? league = entry.value.first.league;
                                  //dd("${league?.name}");
                                  //  dd(league?.toJson());
                                  //    return SizedBox();
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(() => LeagueDetailsScreen(
                                            leagueId: league?.id ?? 0,
                                            imagePath: league?.imagePath ?? '',
                                            leagueCountry:
                                                league?.country?.name ?? '',
                                            leagueName: league?.name ?? '',
                                          ));
                                    },
                                    child: LeagueNameWidget(
                                      ligueImage: "${league?.imagePath}",
                                      ligueText: "${league?.name}",
                                      ligueCountry: "${league?.country?.name}",
                                    ),
                                  );
                                }),
                                ...entry.value.map(
                                  (e) => GestureDetector(
                                    onTap: () {
                                      Get.to(() => FixturesDetailsScreen());
                                    },
                                    child: (e.scores == null ||
                                            e.scores!.isEmpty)
                                        ? AllLeaguesWidget(
                                            teamImage1:
                                                "${e.participants?[0].imagePath}",
                                            teamImage2:
                                                "${e.participants?[1].imagePath}",
                                            teamName1:
                                                "${e.participants?[0].name}",
                                            teamName2:
                                                "${e.participants?[1].name}",
                                            state: "${e.state?.shortName}",
                                            goals: false,
                                            time: DateFormat.Hm().format(DateTime
                                                .fromMillisecondsSinceEpoch(
                                                    (e.startingAtTimestamp ??
                                                            0) *
                                                        1000)),
                                          )
                                        : AllLeaguesWidget(
                                            teamImage1:
                                                "${e.participants?[0].imagePath}",
                                            teamImage2:
                                                "${e.participants?[1].imagePath}",
                                            teamName1:
                                                "${e.participants?[0].name}",
                                            teamName2:
                                                "${e.participants?[1].name}",
                                            state: "${e.state?.shortName}",
                                            score1:
                                                "${e.scores?[0].score?.goals}",
                                            score2:
                                                "${e.scores?[1].score?.goals}"),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
              ],
            ),
          );
        })
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

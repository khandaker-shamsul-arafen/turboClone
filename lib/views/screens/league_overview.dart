import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '/consts/consts.dart';

import '../../controllers/league_details_controller.dart';
import '../widgets/all_leagues_widget.dart';
import '../widgets/match_status_container.dart';
import '../widgets/overview_header_container.dart';
import '../widgets/team_overview_widget.dart';
import '../widgets/top_scorer_widget.dart';
import 'fixtures_details.dart';

class LeagueOverview extends StatefulWidget {
  const LeagueOverview({super.key});

  @override
  State<LeagueOverview> createState() => _LeagueOverviewState();
}

class _LeagueOverviewState extends State<LeagueOverview> {
  LeagueDetailsController leagueDetailsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.all(AppSizes.newSize(1)),
        padding: const EdgeInsets.all(5),
        color: AppColors.overviewBackgroundColor,
        child: ListView(
          shrinkWrap: true,
          children: [
            const MatchStatusContainer(
              matchStatus: 'NEXT MATCHES',
              season: '2023',
            ),
            Container(
              color: Colors.white,
              height: AppSizes.newSize(2),
              child: Padding(
                padding: EdgeInsets.only(bottom: AppSizes.newSize(0.5)),
                child: Image.asset(
                  AppAssets.headerBar,
                  color: Colors.black,
                ),
              ),
            ),
            Column(
              children: [
                Obx(
                  () => Column(
                    children: [
                      ...leagueDetailsController.upComingList
                          .map(
                            (element) => Column(
                              children: [
                                AllLeaguesWidget(
                                  teamImage1: element.participants?[0].imagePath
                                          .toString() ??
                                      "'",
                                  teamImage2: element.participants?[1].imagePath
                                          .toString() ??
                                      '',
                                  teamName1: element.participants?[0].name
                                          .toString() ??
                                      "",
                                  teamName2: element.participants?[1].name
                                          .toString() ??
                                      "",
                                  state:
                                      element.state?.shortName.toString() ?? "",
                                  time: DateFormat.Hm()
                                      .format(DateTime.parse(
                                          element.startingAt ?? ''))
                                      .toString(),
                                  goals: false,
                                ),
                                Container(
                                  height: AppSizes.newSize(1),
                                  width: Get.width,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          )
                          .take(3),
                    ],
                  ),
                )
              ],
            ),
            Column(children: [
              const MatchStatusContainer(
                matchStatus: 'RECENT MATCHES',
                season: '2023/2024',
              ),
              Container(
                color: Colors.white,
                height: AppSizes.newSize(1),
                child: Padding(
                  padding: EdgeInsets.only(bottom: AppSizes.newSize(0.5)),
                  child: Image.asset(
                    AppAssets.headerBar,
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Get.to(() => const FixturesDetailsScreen());
                  },
                  child: Obx(
                    () => Column(
                      children: [
                        ...leagueDetailsController.latestList
                            .map(
                              (element) => Column(
                                children: [
                                  AllLeaguesWidget(
                                      teamImage1:
                                          element.participants?[0].imagePath ??
                                              "'",
                                      teamImage2: element
                                              .participants?[1].imagePath
                                              .toString() ??
                                          '',
                                      teamName1: element.participants?[0].name
                                              .toString() ??
                                          "",
                                      teamName2: element.participants?[1].name
                                              .toString() ??
                                          "",
                                      state:
                                          element.state?.shortName.toString() ??
                                              "",
                                      score1:
                                          "${(element.participants?[0].id == element.scores?[1].participantId) ? (element.scores?[1].score?.goals) : '0'}",
                                      score2:
                                          "${(element.participants?[1].id == element.scores?[1].participantId) ? (element.scores?[3].score?.goals) : '0'}"),
                                  Container(
                                    height: AppSizes.newSize(1),
                                    width: Get.width,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            )
                            .take(3)
                      ],
                    ),
                  )),
            ]),
            SizedBox(
              height: AppSizes.newSize(1),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        offset: const Offset(0, 1),
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: AppSizes.newSize(1),
                      ),
                      const OverviewHeaderContainer(
                        buttonIndex: 1,
                      ),
                      ...List.generate(
                          4,
                          (index) => TeamOverViewWidget(
                                number: index,
                                image:
                                    'https://cdn.sportmonks.com/images/soccer/leagues/1/609.png',
                                name: 'A. JUNIORS',
                                p: '0',
                                w: '0',
                                d: '1',
                                l: '2',
                                gd: '0',
                                pts: '0',
                                buttonIndex: 1,
                                card: 'w',
                              )),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSizes.newSize(1),
                ),
                ...List.generate(2, (index) {
                  return Column(
                    children: [
                      const TopScorerWidget(
                        gA: 'Goal: 1',
                        leagueImage:
                            'https://cdn.sportmonks.com/images/soccer/leagues/1/609.png',
                        playerImage:
                            'https://cdn.sportmonks.com/images/soccer/players/1/1.png',
                        playerName: 'Brayan Angulo',
                        unknownName: 'Puebla',
                      ),
                      SizedBox(
                        height: AppSizes.newSize(1),
                      ),
                    ],
                  );
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}

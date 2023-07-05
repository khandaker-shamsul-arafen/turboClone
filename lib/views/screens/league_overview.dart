import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:turbo_coone1/consts/consts.dart';

import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';
import '../widgets/allLeaguesWidget.dart';
import '../widgets/match_status_container.dart';
import '../widgets/overview_header_container.dart';
import '../widgets/team_overview_widget.dart';
import '../widgets/top_scorer_widget.dart';

class LeagueOverview extends StatelessWidget {
  const LeagueOverview({super.key});

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
                ...List.generate(2, (index) {
                  return Column(
                    children: [
                      const AllLeaguesWidget(
                          teamImage1:
                              "https://cdn.sportmonks.com/images/countries/png/short/ua.png",
                          teamImage2:
                              "https://cdn.sportmonks.com/images/countries/png/short/ua.png",
                          teamName1: "Al Naser",
                          teamName2: "Miami",
                          state: " NS",
                          score1: "0",
                          score2: "1"),
                      Container(
                        height: AppSizes.newSize(2),
                        width: Get.width,
                        color: Colors.white,
                      )
                    ],
                  );
                })
              ],
            ),
            Column(children: [
              const MatchStatusContainer(
                matchStatus: 'RECENT MATCHES',
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
              const AllLeaguesWidget(
                  teamImage1:
                      "https://cdn.sportmonks.com/images/countries/png/short/ua.png",
                  teamImage2:
                      "https://cdn.sportmonks.com/images/countries/png/short/ua.png",
                  teamName1: "Al Naser",
                  teamName2: "Miami",
                  state: " NS",
                  score1: "0",
                  score2: "1"),
              Container(
                height: AppSizes.newSize(2),
                width: Get.width,
                color: Colors.white,
              )
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
                      const OverviewHeaderContainer(),
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

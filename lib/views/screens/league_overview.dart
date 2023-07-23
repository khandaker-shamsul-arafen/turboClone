import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/top_scand_topast.dart';
import '/consts/consts.dart';

import '../../controllers/league_details_controller.dart';
import '../widgets/fixture_widget.dart';
import '../widgets/match_status_container.dart';
import '../widgets/overview_header_container.dart';
import '../widgets/team_overview_widget.dart';
import '../widgets/top_scorer_widget.dart';
import 'fixtures_details.dart';

class LeagueOverview extends StatefulWidget {
  const LeagueOverview({
    super.key,
  });

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
                                FixtureWidget(
                                  element,
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
                                  FixtureWidget(
                                    element,
                                  ),
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
                      // ignore: invalid_use_of_protected_member
                      ...leagueDetailsController.teamOverviewDataList.value
                          .map((index) {
                        return TeamOverViewWidget(
                          number: index.position ?? 0,
                          image: index.participant?.imagePath.toString() ?? "",
                          name: index.participant?.name ?? '',
                          p: (index.details
                                      ?.firstWhereOrNull(
                                          (e) => (e.typeId == 129))
                                      ?.value ??
                                  '')
                              .toString(),
                          w: (index.details
                                      ?.firstWhereOrNull(
                                          (e) => (e.typeId == 130))
                                      ?.value ??
                                  '')
                              .toString(),
                          d: (index.details
                                      ?.firstWhereOrNull(
                                          (element) => (element.typeId == 131))
                                      ?.value ??
                                  '')
                              .toString(),
                          l: (index.details
                                      ?.firstWhereOrNull(
                                          (element) => (element.typeId == 132))
                                      ?.value ??
                                  '')
                              .toString(),
                          gd: (index.details
                                      ?.firstWhereOrNull(
                                          (element) => (element.typeId == 133))
                                      ?.value ??
                                  '')
                              .toString(),
                          pts: (index.details
                                      ?.firstWhereOrNull(
                                          (element) => (element.typeId == 187))
                                      ?.value ??
                                  '')
                              .toString(),
                          buttonIndex: 1,
                          card: const [],
                        );
                      }).take(4),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSizes.newSize(1),
                ),
                Obx(
                  () {
                    Topscorers? topScorer = leagueDetailsController
                        .topScorerList
                        .firstWhereOrNull((element) => element.typeId == 208);
                    Topscorers? topAssist = leagueDetailsController
                        .topScorerList
                        .firstWhereOrNull((element) => element.typeId == 209);
                    if (leagueDetailsController.topScorerLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Column(
                      children: [
                        if (topScorer != null)
                          TopScorerWidget(topScorer, top: 'Top SCORER'),
                        SizedBox(height: AppSizes.newSize(1)),
                        if (topAssist != null)
                          TopScorerWidget(topAssist, top: 'Top ASSIST'),
                      ],
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

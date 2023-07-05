import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbo_coone1/views/screens/top_scores.dart';

import '../../consts/app_assets.dart';
import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';
import '../widgets/match_status_container.dart';
import '../widgets/pt_stats_widget.dart';

class LeaguePlayerStats extends StatelessWidget {
  const LeaguePlayerStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.all(AppSizes.newSize(1)),
        padding: const EdgeInsets.all(5),
        color: AppColors.overviewBackgroundColor,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ...List.generate(3, (index) {
                    return Column(
                      children: [
                        MatchStatusContainer(
                          matchStatus: 'TOP SCORERS',
                          ptStats: true,
                          onTap: () {
                            Get.to(() => TopScorers());
                          },
                        ),
                        Container(
                          color: Colors.white,
                          height: AppSizes.newSize(2),
                          child: Padding(
                            padding:
                                EdgeInsets.only(bottom: AppSizes.newSize(0.5)),
                            child: Image.asset(
                              AppAssets.headerBar,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        ...List.generate(5, (index) {
                          return PtStatsWidget(
                            number: index + 1,
                            image:
                                'https://cdn.sportmonks.com/images/soccer/players/1/1.png',
                            name: "MICHAEL SANTOS",
                            min: '40',
                          );
                        }),
                        SizedBox(
                          height: AppSizes.newSize(1),
                        )
                      ],
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

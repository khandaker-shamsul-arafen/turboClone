import 'package:flutter/material.dart';
import 'package:turbo_coone1/consts/consts.dart';

import '../widgets/allLeaguesWidget.dart';

class LeagueFixtures extends StatelessWidget {
  const LeagueFixtures({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          ...List.generate(3, (index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: AppSizes.newSize(1.5)),
                  child: const Text(
                    "YESTERDAY",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: AppSizes.newSize(2),
                ),
                ...List.generate(3, (index) {
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
                      SizedBox(
                        height: AppSizes.newSize(1.3),
                      )
                    ],
                  );
                })
              ],
            );
          })
        ],
      ),
    );
  }
}

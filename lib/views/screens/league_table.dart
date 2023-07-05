import 'package:flutter/material.dart';

import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';
import '../widgets/overview_header_container.dart';
import '../widgets/team_overview_widget.dart';

class LeagueTable extends StatelessWidget {
  const LeagueTable({super.key});

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
            Row(
              children: [
                Card(
                  child: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: AppSizes.newSize(.5),
                          horizontal: AppSizes.newSize(1)),
                      child: Text("FULL"),
                    ),
                  ),
                ),
                Card(
                  child: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: AppSizes.newSize(.5),
                          horizontal: AppSizes.newSize(1)),
                      child: Text("SHORT"),
                    ),
                  ),
                ),
                Card(
                  child: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: AppSizes.newSize(.5),
                          horizontal: AppSizes.newSize(1)),
                      child: const Text("FORM"),
                    ),
                  ),
                ),
                const Spacer(),
                Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: AppSizes.newSize(.5),
                        horizontal: AppSizes.newSize(1)),
                    child: Row(
                      children: [
                        const Text(
                          "OVERALL",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: AppSizes.newSize(1.8),
                        ),
                        const Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppSizes.newSize(.6),
            ),
            Expanded(
                child: ListView(
              children: [
                ...List.generate(3, (i) {
                  return Column(
                    children: [
                      const OverviewHeaderContainer(),
                      ...List.generate(5, (i) {
                        return TeamOverViewWidget(
                          number: i,
                          image:
                              'https://cdn.sportmonks.com/images/soccer/leagues/1/609.png',
                          name: 'A. JUNIORS',
                          p: '0',
                          w: '0',
                          d: '1',
                          l: '2',
                          gd: '0',
                          pts: '0',
                        );
                      }),
                    ],
                  );
                })
              ],
            )),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';
import '../widgets/overview_header_container.dart';
import '../widgets/team_overview_widget.dart';

class LeagueTable extends StatefulWidget {
  const LeagueTable({super.key});

  @override
  State<LeagueTable> createState() => _LeagueTableState();
}

class _LeagueTableState extends State<LeagueTable> {
  int buttonIndex1 = 3;
  String dropdownvalue = 'OVERALL';

  // List of items in our dropdown menu
  var items = [
    'OVERALL',
    'HOME',
    'AWAY',
  ];
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
                  color: (buttonIndex1 == 1)
                      ? AppColors.leagueNameTabbarBt
                      : Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        buttonIndex1 = 1;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: AppSizes.newSize(.1),
                          horizontal: AppSizes.newSize(1)),
                      child: Text(
                        "FULL",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: AppSizes.size16),
                      ),
                    ),
                  ),
                ),
                Card(
                  color: (buttonIndex1 == 2)
                      ? AppColors.leagueNameTabbarBt
                      : Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        buttonIndex1 = 2;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: AppSizes.newSize(.1),
                          horizontal: AppSizes.newSize(1)),
                      child: Text("SHORT",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: AppSizes.size16)),
                    ),
                  ),
                ),
                Card(
                  color: (buttonIndex1 == 3)
                      ? AppColors.leagueNameTabbarBt
                      : Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        buttonIndex1 = 3;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: AppSizes.newSize(.1),
                          horizontal: AppSizes.newSize(1)),
                      child: Text("FORM",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: AppSizes.size16)),
                    ),
                  ),
                ),
                const Spacer(),
                ClipPath(
                  //  clipper: DropDownClipper(),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: AppSizes.newSize(1),
                          right: AppSizes.newSize(1),
                          top: AppSizes.newSize(.3),
                          bottom: AppSizes.newSize(.3)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isDense: true,
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: AppSizes.newSize(1.7)),
                                child: Text(
                                  items,
                                  style: TextStyle(
                                      fontSize: AppSizes.size14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
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
                      OverviewHeaderContainer(buttonIndex: buttonIndex1),
                      ...List.generate(5, (i) {
                        return TeamOverViewWidget(
                          number: i + 1,
                          image:
                              'https://cdn.sportmonks.com/images/soccer/leagues/1/609.png',
                          name: 'A. JUNIORS',
                          p: '0',
                          w: '0',
                          d: '1',
                          l: '2',
                          gd: '0',
                          pts: '0',
                          buttonIndex: buttonIndex1,
                          card: "w",
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';
import '../../controllers/league_details_controller.dart';
import '../widgets/overview_header_container.dart';
import '../widgets/team_overview_widget.dart';

class LeagueTable extends StatefulWidget {
  const LeagueTable({super.key});

  @override
  State<LeagueTable> createState() => _LeagueTableState();
}

class _LeagueTableState extends State<LeagueTable> {
  int buttonIndex1yyyy = 3;
  String dropdownvalue = 'OVERALL';
  LeagueDetailsController leagueDetailsController = Get.find();

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
                  color: (buttonIndex1yyyy == 1)
                      ? AppColors.leagueNameTabbarBt
                      : Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        buttonIndex1yyyy = 1;
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
                  color: (buttonIndex1yyyy == 2)
                      ? AppColors.leagueNameTabbarBt
                      : Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        buttonIndex1yyyy = 2;
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
                  color: (buttonIndex1yyyy == 3)
                      ? AppColors.leagueNameTabbarBt
                      : Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        buttonIndex1yyyy = 3;
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
                  //clipper: DropDownClipper(),
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
                OverviewHeaderContainer(buttonIndex: buttonIndex1yyyy),
                Obx(() => Column(
                      children: [
                        ...leagueDetailsController.teamOverviewDataList
                            .map((index) {
                          return TeamOverViewWidget(
                            number: index.position ?? 0,
                            image:
                                index.participant?.imagePath.toString() ?? "",
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
                                        ?.firstWhereOrNull((element) =>
                                            (element.typeId == 131))
                                        ?.value ??
                                    '')
                                .toString(),
                            l: (index.details
                                        ?.firstWhereOrNull((element) =>
                                            (element.typeId == 132))
                                        ?.value ??
                                    '')
                                .toString(),
                            gd: (index.details
                                        ?.firstWhereOrNull((element) =>
                                            (element.typeId == 133))
                                        ?.value ??
                                    '')
                                .toString(),
                            pts: (index.details
                                        ?.firstWhereOrNull((element) =>
                                            (element.typeId == 187))
                                        ?.value ??
                                    '')
                                .toString(),
                            buttonIndex: buttonIndex1yyyy,
                            card: index.form
                                    ?.take(5)
                                    .map((element) => element.form ?? '')
                                    .toList() ??
                                [],
                          );
                        }).take(5),
                      ],
                    ))
              ],
            )),
          ],
        ),
      ),
    );
  }
}

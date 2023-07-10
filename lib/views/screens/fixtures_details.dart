import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/app_assets.dart';
import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';
import '../../controllers/fixture_controller.dart';
import 'fixture_preview_tabbar.dart';
import 'league_fixtures.dart';
import 'league_overview.dart';
import 'league_playerstats.dart';
import 'league_table.dart';
import 'league_teams.dart';

class FixturesDetailsScreen extends StatefulWidget {
  const FixturesDetailsScreen({super.key});

  @override
  State<FixturesDetailsScreen> createState() => _FixturesDetailsScreenState();
}

class _FixturesDetailsScreenState extends State<FixturesDetailsScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  //  Get.put(ControllerA());

  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.gradientStart,
            AppColors.gradientEnd,
            AppColors.gradientStart,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
          leading: InkWell(
            onTap: () => Get.back(),
            child: Padding(
              padding: EdgeInsets.all(AppSizes.newSize(2)),
              child: Center(
                child: ImageIcon(
                  const AssetImage(
                    AppAssets.back,
                  ),
                  size: AppSizes.size20,
                ),
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: AppSizes.newSize(3.5),
                width: AppSizes.newSize(3.5),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.sportmonks.com/images/soccer/leagues/1/609.png"))),
              ),
              SizedBox(
                width: AppSizes.newSize(.3),
              ),
              Text(
                "Superliga",
                style: TextStyle(
                    fontSize: AppSizes.size14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.7),
                    height: 1),
              ),
              Text(" | 1st Phase",
                  style: TextStyle(
                      fontSize: AppSizes.size14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white.withOpacity(0.5),
                      height: 1)),
              const Spacer(),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.star_border,
                  size: AppSizes.size30,
                  color: Colors.orange,
                ))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: AppSizes.newSize(5),
                      width: AppSizes.newSize(5),
                      child: Image.network(
                          "https://cdn.sportmonks.com//images//soccer//teams//1//1.png"),
                    ),
                    SizedBox(
                      height: AppSizes.newSize(1),
                    ),
                    const Text(
                      "PLATENSE",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )
                  ],
                ),
                Container(
                  height: AppSizes.newSize(4),
                  width: AppSizes.newSize(6),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: const BorderRadius.all(Radius.circular(4))),
                  child: Center(
                      child: Text(
                    "00:30",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: AppSizes.size14,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: AppSizes.newSize(5),
                      width: AppSizes.newSize(5),
                      child: Image.network(
                          "https://cdn.sportmonks.com//images//soccer//teams//1//1.png"),
                    ),
                    SizedBox(
                      height: AppSizes.newSize(1),
                    ),
                    const Text(
                      "PLATENSE",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: AppSizes.newSize(2),
            ),
            Container(
              color: Colors.transparent,
              height: AppSizes.newSize(2),
              child: Padding(
                padding: EdgeInsets.only(bottom: AppSizes.newSize(0.5)),
                child: Image.asset(
                  AppAssets.headerBar,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: AppSizes.newSize(1),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.newSize(2)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.transparent,
                    height: AppSizes.newSize(3.5),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: AppSizes.newSize(0.5)),
                      child: Image.asset(
                        AppAssets.date,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppSizes.newSize(1),
                  ),
                  Text(
                    "2023-07-06",
                    style: TextStyle(
                        fontSize: AppSizes.size14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: AppSizes.newSize(3),
                  ),
                  Container(
                    color: Colors.transparent,
                    height: AppSizes.newSize(3.5),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: AppSizes.newSize(0.5)),
                      child: Image.asset(
                        AppAssets.venue,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppSizes.newSize(1),
                  ),
                  Expanded(
                    // height: AppSizes.newSize(8),
                    // width: AppSizes.newSize(10),
                    flex: 1,
                    child: Text(
                      "ESTADIO MALVINAS",
                      style: TextStyle(
                          fontSize: AppSizes.size14,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: AppSizes.newSize(1),
                  ),
                  Container(
                    color: Colors.transparent,
                    height: AppSizes.newSize(3.5),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: AppSizes.newSize(0.5)),
                      child: Image.asset(
                        AppAssets.referee,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppSizes.newSize(1),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(top: AppSizes.newSize(0.5)),
                      child: Text(
                        "Pablo Nunez",
                        style: TextStyle(
                            fontSize: AppSizes.size14,
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppSizes.newSize(2),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: Get.width,
                color: Colors.white,
                child: TabBar(
                    isScrollable: true,
                    controller: _tabController,
                    labelColor: Colors.black,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 18),
                    unselectedLabelColor: Colors.black.withOpacity(.9),
                    labelStyle: TextStyle(
                      fontSize: AppSizes.size14,
                      fontWeight: FontWeight.normal,
                    ),
                    indicatorColor: Colors.transparent,
                    indicator: const BoxDecoration(
                        image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage(
                        AppAssets.tabIndicator,
                      ),
                    )),
                    tabs: const [
                      Tab(text: "PREVIEW"),
                      Tab(text: "BROADCAST"),
                      Tab(text: "TABLE"),
                      Tab(text: "H2H"),
                    ]),
              ),
            ),
            Expanded(
              flex: 12,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  FixturePreviewTabbar(),
                  LeagueTable(),
                  LeagueFixtures(),
                  LeaguePlayerStats(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

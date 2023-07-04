import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:turbo_coone1/consts/app_colors.dart';

import '../../consts/app_assets.dart';
import '../../consts/app_sizes.dart';
import 'league_fixtures.dart';
import 'league_overview.dart';
import 'league_playerstats.dart';
import 'league_table.dart';
import 'league_teams.dart';

class LeagueDetailsScreen extends StatefulWidget {
  const LeagueDetailsScreen({super.key});

  @override
  State<LeagueDetailsScreen> createState() => _LeagueDetailsScreenState();
}

class _LeagueDetailsScreenState extends State<LeagueDetailsScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
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
          centerTitle: true,
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: AppSizes.newSize(8),
                  width: AppSizes.newSize(8),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn.sportmonks.com/images/soccer/leagues/1/609.png"))),
                ),
                SizedBox(
                  width: AppSizes.newSize(1),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LIGA MX",
                        style: TextStyle(
                            fontSize: AppSizes.size16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1),
                      ),
                      Text("MEXICO",
                          style: TextStyle(
                              fontSize: AppSizes.size14,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              height: 1)),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  '2023/2024',
                  style: TextStyle(
                    fontSize: AppSizes.size15,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: Colors.white,
                )
              ],
            ),
            SizedBox(
              height: AppSizes.newSize(2),
            ),
            Container(
              height: AppSizes.newSize(6),
              width: Get.width,
              color: Colors.white,
              child: TabBar(
                isScrollable: true,
                controller: _tabController,
                labelColor: Colors.black,
                labelPadding: const EdgeInsets.symmetric(horizontal: 12),
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
                  ),
                ),
                tabs: const [
                  Tab(text: "OVERVIEW"),
                  Tab(text: "TABLE"),
                  Tab(text: "FIXTURES"),
                  Tab(text: "PLAYER STATS"),
                  Tab(text: "TEAMS"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  LeagueOverview(),
                  LeagueTable(),
                  LeagueFixtures(),
                  LeaguePlayerStats(),
                  LeagueTeams()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

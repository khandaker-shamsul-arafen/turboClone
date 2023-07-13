import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '/consts/app_colors.dart';

import '../../consts/app_assets.dart';
import '../../consts/app_sizes.dart';
import '../../controllers/league_details_controller.dart';
import 'league_fixtures.dart';
import 'league_overview.dart';
import 'league_playerstats.dart';
import 'league_table.dart';
import 'league_teams.dart';

class LeagueDetailsScreen extends StatefulWidget {
  final int leagueId;
  final String imagePath;
  final String leagueName;
  final String leagueCountry;
  final String seasonId;
  const LeagueDetailsScreen(
      {super.key,
      required this.leagueId,
      required this.imagePath,
      required this.leagueName,
      required this.leagueCountry,
      required this.seasonId});

  @override
  State<LeagueDetailsScreen> createState() => _LeagueDetailsScreenState();
}

class _LeagueDetailsScreenState extends State<LeagueDetailsScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  LeagueDetailsController leagueDatailscontroller =
      Get.put(LeagueDetailsController());
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    leagueDatailscontroller.recentMatches(widget.leagueId);
    leagueDatailscontroller.getLeagueOverviewTAble(widget.seasonId);
    leagueDatailscontroller.getTopScorer(widget.seasonId);
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
                  margin: EdgeInsets.only(left: AppSizes.newSize(1)),
                  height: AppSizes.newSize(5),
                  width: AppSizes.newSize(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(widget.imagePath))),
                ),
                SizedBox(
                  width: AppSizes.newSize(1),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.leagueName,
                        style: TextStyle(
                          fontSize: AppSizes.size16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1,
                        ),
                      ),
                      Text(widget.leagueCountry,
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

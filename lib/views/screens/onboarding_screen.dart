import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:turbo_coone1/consts/app_sizes.dart';
import 'package:turbo_coone1/utils/helpers.dart';
import 'package:turbo_coone1/views/screens/parent_screen.dart';
import 'package:turbo_coone1/views/widgets/onboarding_widget0.dart';

import '../../consts/app_colors.dart';
import '../../controllers/all_league_controller.dart';
import '../../models/all_league.dart';
import '../widgets/onboarding_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  AllLeagueController allLeagueController = Get.put(AllLeagueController());
  TextEditingController searchController = TextEditingController();
  RxString searchText = ''.obs;

  void initState() {
    allLeagueController.loadLeagues();
    allLeagueController.loadTeams();
    allLeagueController.getStorageLeagueRead();
    allLeagueController.getStorageRead();
    super.initState();
  }

  int index = 0;
  bool selectionisActive = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage("assets/images/splash.png"))),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white.withOpacity(.9),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: AppSizes.newSize(2),
                  horizontal: AppSizes.newSize(4)),
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: AppColors.searchBar,
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    searchText.value = value;
                    dd(searchText.value);
                    (index == 0)
                        ? allLeagueController.searchLeague(value)
                        : allLeagueController.searchTeam(value);
                  },
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black.withOpacity(.6),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(.5),
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 20.0, top: 15.0, right: 20.0, bottom: 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            // OnboardingWidget(),
            Obx(
              () {
                return Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: AppSizes.newSize(2),
                            bottom: AppSizes.newSize(2)),
                        child: Column(
                          children: [
                            Expanded(
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  "FAVOURITE  PLAYER ",
                                  style: TextStyle(
                                      color: (index == 2)
                                          ? Colors.red
                                          : Colors.black,
                                      fontSize: AppSizes.size14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Expanded(
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  "FAVOURITE TEAM",
                                  style: TextStyle(
                                      color: (index == 1)
                                          ? Colors.red
                                          : Colors.black,
                                      fontSize: AppSizes.size14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Expanded(
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  "FAVOURITE LEAGUE",
                                  style: TextStyle(
                                      color: (index == 0)
                                          ? Colors.red
                                          : Colors.black,
                                      fontSize: AppSizes.size14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: AppSizes.newSize(.1),
                      ),
                      Stack(children: [
                        Container(
                          height: Get.height * 0.7,
                          width: AppSizes.newSize(3),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              invertColors: true,
                              image: AssetImage(
                                "assets/matches/header_bar_vertical.png",
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: AppSizes.newSize(.9),
                          top: (index == 0)
                              ? AppSizes.newSize(52)
                              : (index == 1)
                                  ? AppSizes.newSize(34)
                                  : AppSizes.newSize(12),
                          child: Container(
                            height: AppSizes.newSize(1.2),
                            width: AppSizes.newSize(1.2),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          ),
                        )
                      ]),
                      Expanded(
                          child: searchText.value != ''
                              ? (index == 0)
                                  ? ListView(
                                      children: [
                                        ...allLeagueController.searchLeagueList
                                                .map((element) =>
                                                    OnboardingWidget(
                                                        element)) ??
                                            [],
                                      ],
                                    )
                                  : ListView(
                                      children: [
                                        ...allLeagueController.searchTeamList
                                                .map((element) =>
                                                    OnboardingWidget0(
                                                      element: element,
                                                    )) ??
                                            [],
                                      ],
                                    )
                              : (index == 0)
                                  ? ListView(
                                      children: [
                                        ...allLeagueController.favouriteList
                                                .map((element) =>
                                                    OnboardingWidget(
                                                        element)) ??
                                            [],
                                        ...allLeagueController.leagueList.map(
                                            (element) =>
                                                OnboardingWidget(element))
                                      ],
                                    )
                                  : ListView(
                                      children: [
                                        ...allLeagueController.teamFavouriteList
                                                .map((element) =>
                                                    OnboardingWidget0(
                                                      element: element,
                                                    )) ??
                                            [],
                                        ...allLeagueController.teamList
                                            .map((element) => OnboardingWidget0(
                                                  element: element,
                                                ))
                                        //)
                                      ],
                                    )),
                    ],
                  ),
                );
              },
            ), // SizedBox(
            //   height: AppSizes.newSize(7),
            // ),
            SizedBox(
              height: AppSizes.newSize(13),
              child: Padding(
                padding: EdgeInsets.only(bottom: AppSizes.newSize(3)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: AppSizes.newSize(3)),
                      decoration: BoxDecoration(
                        color: (index != 0)
                            ? AppColors.bottomNavigationBackground
                            : Colors.grey,
                      ),
                      child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              if (index > 0) {
                                index -= 1;
                              }
                            });
                          }),
                    ),
                    SizedBox(
                      width: AppSizes.newSize(10),
                    ),
                    (index == 0)
                        ? Container(
                            height: AppSizes.newSize(0.5),
                            width: AppSizes.newSize(1.5),
                            color: AppColors.bottomNavigationBackground,
                          )
                        : Container(
                            height: AppSizes.newSize(0.5),
                            width: AppSizes.newSize(0.5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.searchBar,
                            ),
                          ),
                    (index == 1)
                        ? Container(
                            height: AppSizes.newSize(0.5),
                            width: AppSizes.newSize(1.5),
                            color: AppColors.bottomNavigationBackground,
                          )
                        : Container(
                            height: AppSizes.newSize(0.5),
                            width: AppSizes.newSize(0.5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.searchBar),
                          ),
                    (index == 2)
                        ? Container(
                            height: AppSizes.newSize(0.5),
                            width: AppSizes.newSize(1.5),
                            color: AppColors.bottomNavigationBackground,
                          )
                        : Container(
                            height: AppSizes.newSize(0.5),
                            width: AppSizes.newSize(0.5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.searchBar),
                          ),
                    SizedBox(
                      width: AppSizes.newSize(10),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: AppSizes.newSize(3)),
                      decoration: BoxDecoration(
                        color: AppColors.navbarColor,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            selectionisActive = true;
                            index += 1;
                            if (index == 4) {
                              Get.to(() => const ParentScreen());
                            }
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:turbo_coone1/consts/consts.dart';
import 'package:turbo_coone1/models/all_league.dart';
import 'package:turbo_coone1/utils/helpers.dart';

import '../../controllers/all_league_controller.dart';
import '../../models/team_response.dart';

class OnboardingWidget0 extends StatelessWidget {
  final TeamData element;

  const OnboardingWidget0({
    super.key,
    required this.element,
  });

  //const OnboardingWidge0(this.element, this.isSelected, {super.key});
  @override
  Widget build(BuildContext context) {
    AllLeagueController allLeagueController = Get.find();
    String imagePath = element.imagePath ?? '';
    String leagueName = element.name ?? '';
    String leagueCountryName = element.country?.name ?? '';
    return Padding(
      padding: EdgeInsets.only(
          bottom: AppSizes.newSize(.5),
          left: AppSizes.newSize(1),
          right: AppSizes.newSize(1)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: AppSizes.newSize(5),
              width: AppSizes.newSize(5),
              decoration: BoxDecoration(
                color: AppColors.searchBar,
                shape: BoxShape.circle,
                //image: const DecorationImage(image: NetworkImage('https://cdn.sportmonks.com//images//soccer//teams//29//605.png'))
              ),
              child: Padding(
                padding: EdgeInsets.all(AppSizes.newSize(.7)),
                child: Image.network(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              width: AppSizes.newSize(1),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  leagueName,
                  style: TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      fontSize: AppSizes.size13),
                ),
                Text(
                  leagueCountryName,
                  style: TextStyle(height: 1, fontSize: AppSizes.size12),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  allLeagueController.makeTeamFavourite(element);
                },
                icon: Icon(
                  allLeagueController.teamFavouriteList.contains(element)
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.amber,
                  size: 40,
                )),
          ]),
    );
  }
}

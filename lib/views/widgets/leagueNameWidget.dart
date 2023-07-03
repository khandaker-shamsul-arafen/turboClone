import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';

class LeagueNameWidget extends StatelessWidget {
  final String ligueImage;
  final String ligueText;
  final String ligueCountry;
  const LeagueNameWidget(
      {super.key,
      required this.ligueImage,
      required this.ligueText,
      required this.ligueCountry});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: AppSizes.newSize(7),
      color: AppColors.fixtureContainerBackground,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: AppSizes.newSize(3),
              ),
              child: Container(
                height: AppSizes.newSize(4.4),
                width: AppSizes.newSize(4.4),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 0),
                    )
                  ],
                  color: AppColors.fixtureContainerBackground,
                  image: DecorationImage(
                    image: NetworkImage(ligueImage),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                      width: 1, color: AppColors.fixtureContainerBackground),
                ),
              ),
            ),
            SizedBox(
              width: AppSizes.newSize(2),
            ),
            Padding(
              padding: EdgeInsets.only(top: AppSizes.newSize(.4)),
              child: Container(
                height: AppSizes.newSize(60),
                width: Get.width,
                color: AppColors.fixtureContainerBackground,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ligueText,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppSizes.size16,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: AppSizes.newSize(0.2),
                              left: AppSizes.newSize(1)),
                          child: Text(
                            "|    1st PHASE",
                            style: TextStyle(
                                color: Colors.grey, fontSize: AppSizes.size15),
                          ),
                        )
                      ],
                    ),
                    Text(
                      ligueCountry,
                      style: TextStyle(
                          fontSize: AppSizes.size16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          height: 0.8),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../consts/app_assets.dart';
import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';
import '../widgets/pt_stats_widget.dart';

class TopScorers extends StatelessWidget {
  const TopScorers({super.key});

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
            child: Center(
              child: ImageIcon(
                const AssetImage(
                  AppAssets.back,
                ),
                size: AppSizes.size20,
              ),
            ),
          ),
          title: Text("TOP SCORERS"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
              color: Colors.white,
              child: ListView(
                children: [
                  ...List.generate(
                      50,
                      (index) => Padding(
                            padding:
                                EdgeInsets.only(top: AppSizes.newSize(1.3)),
                            child: PtStatsWidget(
                              number: index + 1,
                              image:
                                  'https://cdn.sportmonks.com/images/soccer/players/1/1.png',
                              name: 'PABLO VEGETTI',
                              min: '13',
                            ),
                          ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

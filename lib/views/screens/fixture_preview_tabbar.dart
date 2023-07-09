import 'package:flutter/material.dart';

import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';
import '../widgets/team_summary_widget.dart';
import '../widgets/venue_container.dart';
import '../widgets/weathet_report_widget.dart';

class FixturePreviewTabbar extends StatelessWidget {
  const FixturePreviewTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.all(AppSizes.newSize(1)),
        padding: const EdgeInsets.all(5),
        color: AppColors.overviewBackgroundColor,
        child: SingleChildScrollView(
          child: Column(children: [
            const TeamSummaryWidget(),
            SizedBox(
              height: AppSizes.newSize(1),
            ),
            const VenueContainerWidget(),
            SizedBox(
              height: AppSizes.newSize(1),
            ),
            const WeatherReportWidget(),
          ]),
        ),
      ),
    );
  }
}

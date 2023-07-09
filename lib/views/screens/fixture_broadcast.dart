import 'package:flutter/material.dart';

import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';

class FixtureBroadcast extends StatelessWidget {
  const FixtureBroadcast({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.all(AppSizes.newSize(1)),
          padding: const EdgeInsets.all(5),
          color: AppColors.overviewBackgroundColor,
        ));
  }
}

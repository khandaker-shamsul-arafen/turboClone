import 'package:flutter/material.dart';

import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';
import '../../consts/app_styles.dart';

class OverviewHeaderContainer extends StatelessWidget {
  const OverviewHeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 5, bottom: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.gradientStart,
            AppColors.gradientEnd,
            AppColors.gradientStart,
          ],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Text(
              '#  SUPERLIGA',
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: AppSizes.size13,
                color: Colors.white.withOpacity(.8),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'P',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: AppSizes.size13,
                color: Colors.white.withOpacity(.8),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'W',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: AppSizes.size13,
                color: Colors.white.withOpacity(.8),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'D',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: AppSizes.size13,
                color: Colors.white.withOpacity(.8),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'L',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: AppSizes.size13,
                color: Colors.white.withOpacity(.8),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'GD',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: AppSizes.size13,
                color: Colors.white.withOpacity(.8),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'PTS',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: AppSizes.size13,
                color: Colors.white.withOpacity(.8),
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

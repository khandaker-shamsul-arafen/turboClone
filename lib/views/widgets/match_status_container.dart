import 'package:flutter/material.dart';

import '../../consts/app_sizes.dart';

class MatchStatusContainer extends StatelessWidget {
  final String matchStatus;
  final String season;
  const MatchStatusContainer(
      {super.key, required this.matchStatus, required this.season});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.newSize(4.5),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(
            left: AppSizes.newSize(1), right: AppSizes.newSize(1)),
        child: Row(
          children: [
            Text(
              matchStatus,
              style: TextStyle(
                  fontSize: AppSizes.size15, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              season,
              style: TextStyle(
                  fontSize: AppSizes.size15, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: AppSizes.newSize(.5),
            ),
            Text(
              "Season",
              style: TextStyle(
                  fontSize: AppSizes.size15, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

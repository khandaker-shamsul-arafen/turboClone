import 'package:flutter/material.dart';

import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';

class PtStatsWidget extends StatelessWidget {
  final int number;
  final String image;
  final String name;
  final String min;
  const PtStatsWidget(
      {super.key,
      required this.number,
      required this.image,
      required this.name,
      required this.min});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            color: Colors.white,
            // height: AppSizes.newSize(40),
            // width: AppSizes.newSize(40),
            child: Row(
              children: [
                SizedBox(
                  width: AppSizes.newSize(1),
                ),
                SizedBox(
                  width: AppSizes.newSize(2.5),
                  child: Text(
                    number.toString(),
                    style: TextStyle(
                        fontSize: AppSizes.size14, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: AppSizes.newSize(1),
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 13,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage(image),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                SizedBox(
                  width: AppSizes.newSize(2),
                ),
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: AppSizes.newSize(1.5)),
                  child: Text(
                    min,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )),
        Container(
          color: Colors.white,
          height: AppSizes.newSize(1),
        )
      ],
    );
  }
}

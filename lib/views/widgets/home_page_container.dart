import 'package:flutter/material.dart';
import '/consts/consts.dart';

class HomePageContainer extends StatelessWidget {
  final String day;
  final String date;
  final bool selected;

  const HomePageContainer(
      {super.key,
      required this.day,
      required this.date,
      this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: AppSizes.newSize(5.0),
      width: AppSizes.newSize(7.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: (selected) ? Colors.white : AppColors.dateContainerColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            day,
            style: (selected)
                ? TextStyle(
                    color: Colors.black, fontSize: AppSizes.size12, height: 1)
                : TextStyle(
                    color: Colors.white, fontSize: AppSizes.size12, height: 1),
          ),
          Text(
            date,
            style: (selected)
                ? TextStyle(
                    color: Colors.black, fontSize: AppSizes.size12, height: 1)
                : TextStyle(
                    color: Colors.white, fontSize: AppSizes.size12, height: 1),
          )
        ],
      ),
    );
  }
}

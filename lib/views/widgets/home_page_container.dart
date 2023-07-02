import 'package:flutter/material.dart';
import 'package:turbo_coone1/consts/consts.dart';

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
      height: AppSizes.newSize(8.0),
      width: AppSizes.newSize(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: (selected) ? Colors.white : Colors.grey.withOpacity(0.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            day,
            style: (selected)
                ? TextStyle(color: Colors.black, fontSize: AppSizes.size14)
                : TextStyle(color: Colors.white, fontSize: AppSizes.size14),
          ),
          Text(
            date,
            style: (selected)
                ? TextStyle(color: Colors.black, fontSize: AppSizes.size14)
                : TextStyle(color: Colors.white, fontSize: AppSizes.size14),
          )
        ],
      ),
    );
  }
}

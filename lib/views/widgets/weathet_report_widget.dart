import 'package:flutter/material.dart';
import 'package:turbo_coone1/consts/consts.dart';

class WeatherReportWidget extends StatelessWidget {
  const WeatherReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(bottom: AppSizes.newSize(2.5)),
        child: Column(children: [
          SizedBox(
            height: AppSizes.newSize(2),
          ),
          Center(
              child: Text(
            "WEATHER",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: AppSizes.size14),
          )),
          SizedBox(
            height: AppSizes.newSize(1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Weather",
                style: TextStyle(color: Colors.grey, fontSize: AppSizes.size14),
              ),
              Text(
                "Temperature",
                style: TextStyle(color: Colors.grey, fontSize: AppSizes.size14),
              ),
              Text(
                "Clouds",
                style: TextStyle(color: Colors.grey, fontSize: AppSizes.size14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "sky is clear",
                style: TextStyle(fontSize: AppSizes.size14),
              ),
              Text(
                "-",
                style: TextStyle(fontSize: AppSizes.size14),
              ),
              Text(
                "9%",
                style: TextStyle(fontSize: AppSizes.size14),
              ),
            ],
          ),
          SizedBox(
            height: AppSizes.newSize(2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "wind Speed",
                style: TextStyle(color: Colors.grey, fontSize: AppSizes.size14),
              ),
              Text(
                "Humidity",
                style: TextStyle(color: Colors.grey, fontSize: AppSizes.size14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "-",
                style: TextStyle(fontSize: AppSizes.size14),
              ),
              Text(
                "73%",
                style: TextStyle(fontSize: AppSizes.size14),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

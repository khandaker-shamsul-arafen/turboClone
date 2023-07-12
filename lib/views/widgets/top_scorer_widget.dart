import 'package:flutter/material.dart';
import '/consts/consts.dart';

class TopScorerWidget extends StatelessWidget {
  final String playerName;
  final String gA;
  final String playerImage;
  final String leagueImage;
  final String unknownName;
  const TopScorerWidget(
      {super.key,
      required this.playerName,
      required this.gA,
      required this.playerImage,
      required this.leagueImage,
      required this.unknownName});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: AppSizes.newSize(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(AppSizes.newSize(1)),
            child: Text(
              "TOP SCORER",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: AppSizes.size13,
                color: Colors.black.withOpacity(.8),
              ),
            ),
          ),
          Image.asset(AppAssets.headerBar, color: Colors.black),
          SizedBox(height: AppSizes.newSize(2)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: AppSizes.newSize(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(image: NetworkImage(playerImage))),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      playerName,
                      maxLines: 1,
                      style: TextStyle(
                        height: 1,
                        fontSize: AppSizes.size16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      gA,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: AppSizes.size14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: AppSizes.newSize(4),
                          width: AppSizes.newSize(4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(leagueImage))),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          unknownName,
                          maxLines: 1,
                          style: TextStyle(
                            height: 1,
                            fontSize: AppSizes.size16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

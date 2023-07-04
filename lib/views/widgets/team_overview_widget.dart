import 'package:flutter/material.dart';

import '../../consts/app_sizes.dart';

class TeamOverViewWidget extends StatelessWidget {
  const TeamOverViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppSizes.newSize(5),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(top: AppSizes.newSize(.5)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              width: AppSizes.newSize(0.8),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "1",
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        height: AppSizes.newSize(4),
                        width: AppSizes.newSize(4),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://cdn.sportmonks.com/images/soccer/leagues/1/609.png"))),
                      ),
                    ),

                    //   ),
                    // ),
                    SizedBox(width: AppSizes.newSize(.2)),
                    Expanded(
                      flex: 5,
                      child: Text(
                        "A. JUNIORS",
                        style: TextStyle(
                            fontSize: AppSizes.size14,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "0",
                style: TextStyle(
                    fontSize: AppSizes.size14, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "0",
                style: TextStyle(
                    fontSize: AppSizes.size14, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "0",
                style: TextStyle(
                    fontSize: AppSizes.size14, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "0",
                style: TextStyle(
                    fontSize: AppSizes.size14, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "0",
                style: TextStyle(
                    fontSize: AppSizes.size14, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "0",
                style: TextStyle(
                    fontSize: AppSizes.size14, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ));
  }
}

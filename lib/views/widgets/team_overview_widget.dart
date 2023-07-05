import 'package:flutter/material.dart';

import '../../consts/app_sizes.dart';

class TeamOverViewWidget extends StatelessWidget {
  final int number;
  final String image;
  final String name;
  final String p;
  final String w;
  final String d;
  final String l;
  final String gd;
  final String pts;
  const TeamOverViewWidget(
      {super.key,
      required this.number,
      required this.image,
      required this.name,
      required this.p,
      required this.w,
      required this.d,
      required this.l,
      required this.gd,
      required this.pts});

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
                    Expanded(
                      child: Text(
                        number.toString(),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        height: AppSizes.newSize(4),
                        width: AppSizes.newSize(4),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: NetworkImage(image))),
                      ),
                    ),

                    //   ),
                    // ),
                    SizedBox(width: AppSizes.newSize(.2)),
                    Expanded(
                      flex: 5,
                      child: Text(
                        name,
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
                p,
                style: TextStyle(
                    fontSize: AppSizes.size14, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                w,
                style: TextStyle(
                    fontSize: AppSizes.size14, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                d,
                style: TextStyle(
                    fontSize: AppSizes.size14, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                l,
                style: TextStyle(
                    fontSize: AppSizes.size14, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                gd,
                style: TextStyle(
                    fontSize: AppSizes.size14, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                pts,
                style: TextStyle(
                    fontSize: AppSizes.size14, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ));
  }
}

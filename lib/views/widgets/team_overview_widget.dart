import 'package:flutter/material.dart';

import '../../consts/app_sizes.dart';
import 'card_clipper.dart';

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
  final int buttonIndex;
  final List<String> card;
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
      required this.pts,
      required this.buttonIndex,
      required this.card});

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
                    flex: 1,
                    child: Text(
                      number.toString(),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    flex: 1,
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
                    flex: 9,
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
          Visibility(
            visible: (buttonIndex == 1 || buttonIndex == 2)
                ? true
                : (buttonIndex == 2)
                    ? true
                    : false,
            child: Expanded(
              flex: 1,
              child: Text(
                p,
                style: TextStyle(
                    fontSize: AppSizes.size14,
                    fontWeight: FontWeight.normal,
                    height: 2.2),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Visibility(
            visible: buttonIndex == 1 ? true : false,
            child: Expanded(
              flex: 1,
              child: Text(
                w,
                style: TextStyle(
                    fontSize: AppSizes.size14,
                    fontWeight: FontWeight.normal,
                    height: 2.2),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Visibility(
            visible: (buttonIndex == 1) ? true : false,
            child: Expanded(
              flex: 1,
              child: Text(
                d,
                style: TextStyle(
                    fontSize: AppSizes.size14,
                    fontWeight: FontWeight.normal,
                    height: 2.2),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Visibility(
            visible: (buttonIndex == 1) ? true : false,
            child: Expanded(
              flex: 1,
              child: Text(
                l,
                style: TextStyle(
                    fontSize: AppSizes.size14,
                    fontWeight: FontWeight.normal,
                    height: 2.2),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Visibility(
            visible: (buttonIndex == 1)
                ? true
                : (buttonIndex == 2)
                    ? true
                    : false,
            child: Expanded(
              flex: 1,
              child: Text(
                gd,
                style: TextStyle(
                    fontSize: AppSizes.size14,
                    fontWeight: FontWeight.normal,
                    height: 2.2),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Visibility(
            visible: (buttonIndex == 1)
                ? true
                : (buttonIndex == 2)
                    ? true
                    : false,
            child: Expanded(
              flex: 2,
              child: Text(
                pts,
                style: TextStyle(
                    fontSize: AppSizes.size14,
                    fontWeight: FontWeight.normal,
                    height: 2.2),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Visibility(
            visible: (buttonIndex == 3),
            child: Expanded(
              flex: 6,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...card.map(
                      (e) => ClipPath(
                        clipper: CardClipper(),
                        child: Container(
                          color: (e.toUpperCase() == 'W')
                              ? Colors.green
                              : (e.toUpperCase() == 'L')
                                  ? Colors.red
                                  : Colors.grey,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppSizes.newSize(0.10),
                                horizontal: AppSizes.newSize(0.8)),
                            child: Text(
                              e,
                              style: TextStyle(
                                  fontSize: AppSizes.size14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:turbo_coone1/consts/consts.dart';

import '../../consts/app_sizes.dart';

class TeamSummaryWidget extends StatelessWidget {
  const TeamSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizes.newSize(1), vertical: AppSizes.newSize(1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CachedNetworkImage(
                width: AppSizes.newSize(3),
                height: AppSizes.newSize(3),
                imageUrl:
                    "https://cdn.sportmonks.com//images//soccer//teams//1//1.png",
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Expanded(
                child: Container(
                  child: Image.asset(
                    AppAssets.divideBar,
                    height: AppSizes.newSize(1),
                    color: Colors.black,
                  ),
                ),
              ),
              const Text(
                "HEAD 2 HEAD",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Expanded(
                child: Container(
                  child: Image.asset(
                    AppAssets.divideBar,
                    height: AppSizes.newSize(1),
                    color: Colors.black,
                  ),
                ),
              ),
              CachedNetworkImage(
                width: AppSizes.newSize(3),
                height: AppSizes.newSize(3),
                imageUrl:
                    "https://cdn.sportmonks.com//images//soccer//teams//1//1.png",
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ],
          ),
        ),
        Center(
            child: Text(
          "9 MATCHES",
          style: TextStyle(color: Colors.grey, fontSize: AppSizes.size15),
        )),
        Center(
          child: Container(
            width: Get.width * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "3",
                        style: TextStyle(
                            height: 1,
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                            fontSize: AppSizes.size14),
                      ),
                      const Text(
                        "Wins",
                        style: TextStyle(height: 1, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const Text(
                  '/',
                  style: TextStyle(height: 1),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "3",
                        style: TextStyle(
                            height: 1,
                            fontSize: AppSizes.size14,
                            fontWeight: FontWeight.w600,
                            color: Colors.purple),
                      ),
                      const Text(
                        "Draw",
                        style: TextStyle(height: 1, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const Text('/', style: TextStyle(height: 1)),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "3",
                        style: TextStyle(
                          height: 1,
                          fontWeight: FontWeight.w600,
                          fontSize: AppSizes.size14,
                        ),
                      ),
                      const Text(
                        "Wins",
                        style: TextStyle(height: 1, color: Colors.grey),
                      ),
                      SizedBox(
                        height: AppSizes.size20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: AppSizes.newSize(2), right: AppSizes.newSize(2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "3 wins 33%",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.purple.withOpacity(.48)),
              ),
              Text(
                "3 33%",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.purple.withOpacity(.48)),
              ),
              Text(
                "3 wins 33%",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.purple.withOpacity(.48)),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: AppSizes.newSize(.7),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xFFE93E56),
                        Color(0xFFB32033),
                        Color(0xFFA5192B),
                      ]),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: AppSizes.newSize(.7),
                  decoration: const BoxDecoration(color: Colors.grey),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: AppSizes.newSize(.7),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xFF0A0B0C),
                        Color(0xFF514F92),
                        Color(0xFFCCCBEB),
                      ]),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

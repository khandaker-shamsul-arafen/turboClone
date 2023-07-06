import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../consts/app_assets.dart';
import '../../consts/app_sizes.dart';

class VenueContainerWidget extends StatelessWidget {
  const VenueContainerWidget({super.key});

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
              Text(
                "VENUE",
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: AppSizes.size12),
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
            "VENUE",
            style: TextStyle(
                color: Colors.grey.withOpacity(1), fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Column(
                children: [
                  CachedNetworkImage(
                    width: AppSizes.newSize(16),
                    height: AppSizes.newSize(11),
                    imageUrl:
                        "https://cdn.sportmonks.com/images/soccer/venues/4/2020.png",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.contain,
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}

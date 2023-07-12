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
                child: Image.asset(
                  AppAssets.divideBar,
                  height: AppSizes.newSize(1),
                  color: Colors.black,
                ),
              ),
              Text(
                "VENUE",
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: AppSizes.size12),
              ),
              Expanded(
                child: Image.asset(
                  AppAssets.divideBar,
                  height: AppSizes.newSize(1),
                  color: Colors.black,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: AppSizes.newSize(1.5)),
                child: Column(
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
                ),
              ),
              SizedBox(
                width: AppSizes.newSize(1),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                        height: 1.5,
                        color: Colors.grey,
                        fontSize: AppSizes.size14),
                  ),
                  Text(
                    "Capacity",
                    style: TextStyle(
                        height: 1.5,
                        color: Colors.grey,
                        fontSize: AppSizes.size14),
                  ),
                  Text(
                    "Surface",
                    style: TextStyle(
                        height: 1.5,
                        color: Colors.grey,
                        fontSize: AppSizes.size14),
                  ),
                  Text(
                    "Address",
                    style: TextStyle(
                        height: 1.5,
                        color: Colors.grey,
                        fontSize: AppSizes.size14),
                  ),
                  Text(
                    "City",
                    style: TextStyle(
                        height: 1.5,
                        color: Colors.grey,
                        fontSize: AppSizes.size14),
                  ),
                ],
              ),
              SizedBox(
                width: AppSizes.newSize(2),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Wiklof Holding ergergeg",
                      style: TextStyle(
                          height: 1.7,
                          fontSize: AppSizes.size13,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      "1650",
                      style: TextStyle(
                          height: 1.7,
                          fontSize: AppSizes.size13,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "grass",
                      style: TextStyle(
                          height: 1.7,
                          fontSize: AppSizes.size13,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Idrottsgatan",
                      style: TextStyle(
                          height: 1.7,
                          fontSize: AppSizes.size13,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Mariehamn",
                      style: TextStyle(
                          height: 1.7,
                          fontSize: AppSizes.size13,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

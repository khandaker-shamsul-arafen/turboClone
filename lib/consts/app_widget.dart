import 'package:flutter/material.dart';
import '/consts/app_sizes.dart';

class AppWidgets {
  Widget gapH(
    double height,
  ) {
    return SizedBox(
      height: AppSizes.newSize(height),
    );
  }

  Widget gapW(double width) {
    return SizedBox(
      width: AppSizes.newSize(width),
    );
  }

  Widget gapW10() {
    return SizedBox(
      width: AppSizes.newSize(10),
    );
  }

  Widget gapH10() {
    return SizedBox(
      height: AppSizes.newSize(10),
    );
  }

  Widget gapH8() {
    return SizedBox(
      height: AppSizes.newSize(8),
    );
  }

  Widget gapW8() {
    return SizedBox(
      width: AppSizes.newSize(8),
    );
  }

  Widget gapH16() {
    return SizedBox(
      height: AppSizes.newSize(16),
    );
  }

  Widget gapW16() {
    return SizedBox(
      width: AppSizes.newSize(16),
    );
  }
}

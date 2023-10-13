import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/core/constants/assets.dart';

import '../../../config/Theme/text_styles.dart';

class OnboardingModel {
  final String image;
  final Widget title;

  OnboardingModel({required this.image, required this.title});
}

final onboardingList = <OnboardingModel>[
  OnboardingModel(
    image: Assets.assetsPicturesPlant1,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(TextSpan(
            style: poppinsStyle.copyWith(
              fontSize: 40.sp,
            ),
            children: const [
              TextSpan(text: 'Enjoy your\nLife With '),
              TextSpan(
                  style: TextStyle(fontWeight: FontWeight.bold), text: 'Plants')
            ]))
      ],
    ),
  ),
  OnboardingModel(
    image: Assets.assetsPicturesPlant2,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(TextSpan(
            style: poppinsStyle.copyWith(
              fontSize: 40.sp,
            ),
            children: const [
              TextSpan(text: 'Grow your own\nindoor '),
              TextSpan(
                  style: TextStyle(fontWeight: FontWeight.bold), text: 'Garden')
            ]))
      ],
    ),
  ),
  OnboardingModel(
    image: Assets.assetsPicturesPlant3,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(TextSpan(
            style: poppinsStyle.copyWith(
              fontSize: 40.sp,
            ),
            children: const [
              TextSpan(text: 'Add life\nto your '),
              TextSpan(
                  style: TextStyle(fontWeight: FontWeight.bold), text: 'space')
            ]))
      ],
    ),
  )
];

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/assets.dart';

class ScrollablePage extends StatelessWidget {
  const ScrollablePage({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: 322.w,
          height: 391.h,
          fit: BoxFit.fitHeight,
        ),
        SizedBox(
          height: 29.h,
        ),
      ],
    );
  }
}

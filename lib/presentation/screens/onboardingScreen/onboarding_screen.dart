import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_app/config/palette.dart';
import 'package:plant_app/core/constants/assets.dart';
import 'package:plant_app/presentation/screens/onboardingScreen/onboarding_list.dart';

import '../../../config/Theme/text_styles.dart';
import 'components/scrollable_page.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  int currentPageIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              _skip(),
              _scrollable(),

              _dots(),
              _subtitle(),

              // circle button
              _nextButton()
            ],
          ),
        ),
      ),
    );
  }

  TextButton _nextButton() {
    return TextButton(
      onPressed: () {
        int nextPage = currentPageIndex + 1;
        _pageController.animateToPage(nextPage,
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      },
      child: CircleAvatar(
        backgroundColor: MyColorPalette.kSecondaryColor,
        radius: 32.r,
        child: const Icon(
          Icons.arrow_forward,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }

  Column _subtitle() {
    return Column(
      children: [
        SizedBox(
          height: 56.h,
        ),
        onboardingList[currentPageIndex].title,
        SizedBox(
          height: 47.h,
        ),
      ],
    );
  }

  Row _dots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 57.h,
        ),
        buildDot(index: 0),
        buildDot(index: 1),
        buildDot(index: 2),
      ],
    );
  }

  Expanded _scrollable() {
    return Expanded(
      child: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        controller: _pageController,
        itemCount: onboardingList.length,
        itemBuilder: (context, index) => ScrollablePage(
          image: onboardingList[index].image,
        ),
      ),
    );
  }

  Padding _skip() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.black),
            onPressed: () {},
            child: (currentPageIndex != 2)
                ? Text("Skip",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ))
                : const Text(""),
          ),
        ));
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 5),
      height: 8.h,
      width: currentPageIndex == index ? 24.w : 6.w,
      decoration: BoxDecoration(
        color: currentPageIndex == index
            ? MyColorPalette.kSecondaryColor
            : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

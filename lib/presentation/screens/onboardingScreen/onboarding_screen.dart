import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_app/config/RouterConfig/route_names.dart';
import 'package:plant_app/config/palette.dart';
import 'package:plant_app/presentation/screens/OnboardingScreen/onboarding_list.dart';

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
      body: _body(size),
    );
  }

  SafeArea _body(Size size) {
    return SafeArea(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _skip(),
              _scrollable(),
              _dots(),
              _subtitle(),
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
        if (currentPageIndex >= 2) {
          context.push(RouteNames.searchScreen);
        }
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
          height: 45.h,
        ),
        onboardingList[currentPageIndex].title,
        SizedBox(
          height: 45.h,
        ),
      ],
    );
  }

  _dots() {
    return Column(
      children: [
        SizedBox(
          height: 29.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildDot(index: 0),
            buildDot(index: 1),
            buildDot(index: 2),
          ],
        ),
      ],
    );
  }

  _scrollable() {
    return SizedBox(
      height: 391.h,
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
            onPressed: () {
              context.push(RouteNames.searchScreen);
            },
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
      curve: Curves.easeIn,
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

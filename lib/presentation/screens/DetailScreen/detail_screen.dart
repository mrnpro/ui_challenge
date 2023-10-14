import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_app/core/constants/assets.dart';
import 'package:plant_app/plant_data.dart';

import '../../../config/palette.dart';

class DetailScreen extends ConsumerStatefulWidget {
  const DetailScreen({
    super.key,
    required this.plant,
  });
  final PlantModel plant;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: _body(context, size),
    );
  }

  _body(BuildContext context, Size size) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _appBar(context),
                _plantDisplay(size),
                _plantTitleDescription(),
                SizedBox(
                  height: 100.h,
                ),
                _infoBox(size)
              ],
            ),
          )),
    );
  }

  Column _plantTitleDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _plantName(),
        const SizedBox(
          height: 15,
        ),
        const Text(
            "Plants make your life with minimal and happy\nlove the plants more and enjoy life.",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            )),
      ],
    );
  }

  Stack _plantDisplay(Size size) {
    return Stack(
      children: [
        _dots(size),
        _plantImage(),
      ],
    );
  }

  _infoBox(Size size) {
    return Column(
      children: [
        Container(
          width: size.width,
          height: 237,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(31),
              color: MyColorPalette.kSecondaryColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(Assets.assetsSvgHeightIcon),
                      const Text("Height",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      const Text("30cm - 40cm",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.white))
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(Assets.assetsSvgTemperatureIcon),
                      const Text("Tempreture",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      const Text("20C to 25C",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.white))
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(Assets.assetsSvgPotIcon),
                      const Text("Pot",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      const Text("Ciramic Pot",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.white))
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Price",
                          style: TextStyle(
                            color: MyColorPalette.kPrimaryColor,
                            fontSize: 20,
                          )),
                      Text("\$12.99",
                          style: TextStyle(
                              color: MyColorPalette.kPrimaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)), //
                          backgroundColor: MyColorPalette.kThirdColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 41, vertical: 20)),
                      onPressed: () {},
                      child: Text("Add to cart",
                          style: TextStyle(
                            color: MyColorPalette.kPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ))),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Text _plantName() {
    return Text(widget.plant.name,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w500,
        ));
  }

  Hero _plantImage() {
    return Hero(
      tag: widget.plant.id,
      child: Image.asset(
        widget.plant.image,
        width: 322,
        height: 391,
      ),
    );
  }

  Positioned _dots(Size size) {
    return Positioned(
      right: 0,
      top: size.height / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildDot(index: 0),
          const SizedBox(
            height: 3,
          ),
          buildDot(index: 1),
          const SizedBox(
            height: 3,
          ),
          buildDot(index: 2),
        ],
      ),
    );
  }

  Padding _appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          SvgPicture.asset(
            Assets.assetsSvgBagFillIcon,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 5),
      height: currentPageIndex == index ? 30 : 9,
      width: 9,
      decoration: BoxDecoration(
        color: currentPageIndex == index
            ? MyColorPalette.kSecondaryColor
            : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

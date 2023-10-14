import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_app/config/RouterConfig/route_names.dart';
import 'package:plant_app/config/Theme/text_styles.dart';
import 'package:plant_app/config/palette.dart';
import 'package:plant_app/core/constants/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/core/utils/color_util.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../plant_data.dart';
import 'widgets/plant_item.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: HexColor('ECEBF0'),
      body: _body(size),
    );
  }

  SafeArea _body(Size size) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [_appBar(), _searchFIlter(), _maiinList()],
          ),
        ),
      ),
    );
  }

  Expanded _maiinList() {
    return Expanded(
        child: MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      itemCount: plantList.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _foundText();
        }
        return PlantItem(
          onPressed: () {
            context.push(RouteNames.detailScreen, extra: plantList[index]);
          },
          plant: plantList[index],
        );
      },
    ));
  }

  Padding _foundText() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20.0),
      child: Container(
        height: 90.h,
        width: 0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          "Found\n10 Results",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
        ),
      ),
    );
  }

  Column _searchFIlter() {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 310.w,
                height: 48.h,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 228, 228, 228)
                            .withOpacity(0.5), // Shadow color
                        spreadRadius: 1, // Spread radius
                        blurRadius: 2, // Blur radius
                        offset: const Offset(
                            0, 3), // Offset in the x and y directions
                      ),
                    ],
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.assetsSvgSearchLightIcon),
                      Expanded(
                          child: TextFormField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search plants"),
                      ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.0)), //
                    backgroundColor: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h)),
                onPressed: () {},
                child: SvgPicture.asset(
                  Assets.assetsSvgFilterIcon,
                  height: 25.h,
                  color: Colors.black,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Padding _appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          const Text("Search Products",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              )),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.white, width: 2)),
            child: Image.asset(
              Assets.assetsPicturesUserAvatar,
              width: 48,
              height: 48,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({
    Key? key,
    required double w,
  })  : _w = w,
        super(key: key);

  final double _w;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // height: 100.0,
      child: Shimmer.fromColors(
        baseColor: notificationTileColor,
        highlightColor: mutedColor,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.18,
          child: ListView.separated(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 19.w,
                    height: 19.w,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 185, 182, 182),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  commonHeight1,
                ],
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 5.w,
            ),
          ),
        ),
      ),
    );
  }
}

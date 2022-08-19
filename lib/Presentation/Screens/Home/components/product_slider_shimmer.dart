import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({
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
        child: LimitedBox(
          maxHeight: 0.4 * _w,
          child: ListView.separated(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  SizedBox(
                    width: 44.w,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: 41.w,
                        height: 0.37 * _w,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 185, 182, 182),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 3.w,
            ),
          ),
        ),
      ),
    );
  }
}

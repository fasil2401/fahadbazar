import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';

class SinglePageShimmer extends StatelessWidget {
  const SinglePageShimmer({
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
        child: Column(
          children: [
            Container(
              height: _w / 2,
              decoration: BoxDecoration(
                color: notificationTileColor,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    spreadRadius: 3,
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h),
            Container(
              height: _w / 4,
              decoration: BoxDecoration(
                color: notificationTileColor,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    spreadRadius: 3,
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h),
            Container(
              height: _w / 4,
              decoration: BoxDecoration(
                color: notificationTileColor,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    spreadRadius: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

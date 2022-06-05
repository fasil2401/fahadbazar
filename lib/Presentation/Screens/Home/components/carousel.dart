import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../../constants/images.dart';

class CarouselMain extends StatelessWidget {
  const CarouselMain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 23.h,
        viewportFraction: 0.9,
        autoPlay: true,
      ),
      items: imgList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  color: commonScaffoldBack,
                  image: DecorationImage(
                      image: AssetImage(
                        i,
                      ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(24)),
            );
          },
        );
      }).toList(),
    );
  }
}
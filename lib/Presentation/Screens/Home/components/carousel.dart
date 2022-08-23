import 'package:carousel_slider/carousel_slider.dart';
import 'package:fahadbazar/constants/api_const.dart';
import 'package:fahadbazar/models/Home%20Model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../../constants/images.dart';

class CarouselMain extends StatelessWidget {
  CarouselMain({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<dynamic> list;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 23.h,
        viewportFraction: 0.9,
        autoPlay: true,
      ),
      items: list.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  color: commonScaffoldBack,
                  image: DecorationImage(
                      image: NetworkImage(
                        '${ApiConstants.imageUrl}${i.image}',
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

class CarouselSinglePage extends StatelessWidget {
  CarouselSinglePage({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<dynamic> list;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 26.h,
        viewportFraction: 0.9,
        // autoPlay: true,
      ),
      items: list.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(
                        '${ApiConstants.imageUrl}/${i}',
                      ),
                      fit: BoxFit.contain),
                  borderRadius: BorderRadius.circular(24)),
            );
          },
        );
      }).toList(),
    );
  }
}

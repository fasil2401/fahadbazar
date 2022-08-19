import 'package:fahadbazar/constants/api_const.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/heights.dart';
import '../constants/images.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<dynamic> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      child: ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
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
                  image: DecorationImage(
                      image: NetworkImage(
                        '${ApiConstants.imageUrl}${list[index].image}',
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              commonHeight1,
              SizedBox(
                width: 19.w,
                child: Text(
                  list[index].name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Rubik'),
                ),
              )
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 5.w,
        ),
      ),
    );
  }
}

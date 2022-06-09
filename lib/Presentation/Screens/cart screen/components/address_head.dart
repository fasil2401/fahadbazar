import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import 'address_name.dart';


class AddressHead extends StatelessWidget {
  final String type;
  const AddressHead({
    Key? key, required this.type
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: AddressName(text: 'Angelina Jolie',),
        ),
        SizedBox(
          width: 2.w,
        ),
        Container(
          decoration: BoxDecoration(
              color: offrGreen,
              borderRadius: BorderRadius.circular(5)),
          child:  Padding(
            padding:const EdgeInsets.all(4),
            child: Text(
              type,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Rubik',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}

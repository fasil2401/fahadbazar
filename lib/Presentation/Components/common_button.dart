import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../logic/Controller/api/Address/address_controller.dart';
import '../constants/colors.dart';

final addressController = Get.put(AddressController());

class CommonButton extends StatelessWidget {
  final String text;
  final String check;
  final Function() onPressed;
  const CommonButton({
    Key? key,
    required this.text,
    this.check = 'no',
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 6.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment(-0.95, 0.0),
          end: Alignment(0.5, 0.0),
          colors: [Color(0xff1A2859), Color(0xff3F489E)],
          stops: [0.0, 1.5],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              onPrimary: mutedBlueColor,
              //side: BorderSide(width: 3.0, color: Colors.transparent,),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              primary: Colors.transparent),
          child: Text(
            text,
            style: TextStyle(
                fontFamily: "Rubik", fontSize: 14.sp, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

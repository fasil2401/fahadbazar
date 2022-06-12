
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AccountName extends StatelessWidget {
  const AccountName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Angelina Jolie',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 22.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class AccountEmail extends StatelessWidget {
  const AccountEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'fasil2401@gmail.com',
      style: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

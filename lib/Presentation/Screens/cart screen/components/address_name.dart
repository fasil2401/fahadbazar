import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AddressName extends StatelessWidget {
  const AddressName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Angelina Jolie',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontFamily: 'Rubik', fontSize: 13.sp, fontWeight: FontWeight.bold));
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AddressName extends StatelessWidget {
  final String text;
  const AddressName({
    Key? key,required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontFamily: 'Rubik', fontSize: 13.sp, fontWeight: FontWeight.bold));
  }
}

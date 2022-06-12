import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class OrderButton extends StatelessWidget {

  final String title;
  final Color container;
  const OrderButton({
    Key? key,required this.title, required this.container
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: container,
        borderRadius: BorderRadius.circular(7)
      ),                          
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
          child: Center(
            child: Text(title,
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 8.sp,
              color: Colors.white
            ),
            ),
          ),
        ));
  }
}

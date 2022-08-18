import 'package:flutter/material.dart';

import 'common_button.dart';


class PositionedButton extends StatelessWidget {
  final String text;
  final String check;
  final Function() onPressed;
  const PositionedButton({
    Key? key,required this.text,this.check = 'no',
    required this.sw,
    required this.onPressed,
  }) : super(key: key);

  final double sw;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: sw * 0.25,
        width: MediaQuery.of(context).size.width,
        decoration:const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: sw * 0.06),
            child: CommonButton(text: text,check: check,onPressed: onPressed,),
          ),
        ),
      ),
    );
  }
}

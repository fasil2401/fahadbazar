import 'package:flutter/material.dart';


class CartPrice extends StatelessWidget {
  const CartPrice({
    Key? key,
    required this.sw,
  }) : super(key: key);

  final double sw;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        '₹600',
        style: TextStyle(
          fontFamily: 'Rubik',
          fontSize: 0.055 * sw,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class CartNameText extends StatelessWidget {
  const CartNameText({
    Key? key,
    required this.sw,
    required this.text
  }) : super(key: key);

  final double sw;
   final String text;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Rubik',
          fontSize: 0.04 * sw,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'cart_adjust_button.dart';
import 'cart_text.dart';


class CartItems extends StatelessWidget {
  const CartItems({
    Key? key,
    required this.sw,
    required this.text,
    this.visible= true
  }) : super(key: key);

  final double sw;
  final bool visible;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CartNameText(sw: sw, text: text,),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: visible,
                child: CartAdjust(sw: sw)),
             const SizedBox(width: 10,),
              CartPrice(sw: sw),
            ],
          ),
        )
      ],
    );
  }
}

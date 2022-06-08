import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/heights.dart';
import 'cart_items.dart';


class CartBill extends StatelessWidget {
  const CartBill({
    Key? key,
    required this.sw,
  }) : super(key: key);

  final double sw;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartItems(
          sw: sw,
          visible: false,
          text: 'Item total',
        ),
        commonHeight3,
        CartItems(
          sw: sw,
          visible: false,
          text: 'Delivery charges',
        ),
        commonHeight1,
        const Divider(
          thickness: 0.5,
          color: mutedColor,
        ),
        commonHeight1,
        CartItems(
          sw: sw,
          visible: false,
          text: 'Total Amount',
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../constants/colors.dart';


class CartAdjust extends StatelessWidget {
  const CartAdjust({
    Key? key,
    required this.sw,
  }) : super(key: key);

  final double sw;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.4, color: mutedColor),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Row(
          children: [
           const InkWell(
              child: Icon(Icons.remove,
              size: 20,
              color: Colors.green,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text('1',
              style: TextStyle(
                color: Colors.green,
          fontFamily: 'Rubik',
          fontSize: 0.047 * sw,
          fontWeight: FontWeight.w500,
        ),
              ),
            ),
           const InkWell(
              child: Icon(Icons.add,
               size: 20,
              color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

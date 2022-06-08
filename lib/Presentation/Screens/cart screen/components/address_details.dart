import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import 'address_head.dart';


class AddressDetails extends StatelessWidget {
  final String type;
  const AddressDetails({
    Key? key,required this.type
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddressHead(type: type,),
        const Text('9745640896',
        style: TextStyle(
          color: mutedColor,
          fontFamily: 'Rubik'
        ),
        ),
      
         const Text('ERE business solutions, cyberpark,',
        style: TextStyle(
          color: mutedColor,
          fontFamily: 'Rubik'
        ),
        ),
         const Text('kozhikode, kerala,673636',
        style: TextStyle(
          color: mutedColor,
          fontFamily: 'Rubik'
        ),
        ),
      ],
    );
  }
}

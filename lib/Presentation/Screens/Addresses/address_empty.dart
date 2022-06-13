import 'package:fahadbazar/Presentation/Components/section_head.dart';
import 'package:fahadbazar/Presentation/Screens/support/components/support_tile.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/notifications.dart';
import 'package:fahadbazar/Presentation/constants/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../Components/appbar_inner.dart';
import '../../Components/positioned_bitton.dart';
import '../../constants/colors.dart';

class AddressEmptyScreen extends StatelessWidget {
  const AddressEmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: commonScaffoldBack,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarInner(
          title: 'Addresses',
          visible: false,
          cart: false,
        ),
      ),
      
    );
  }
}

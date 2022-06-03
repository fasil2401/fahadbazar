import 'dart:ui';

import 'package:fahadbazar/Presentation/Components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Components/app_bar_text.dart';
import '../../constants/colors.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: commonScaffoldBack,
      appBar: PreferredSize(
         preferredSize: Size.fromHeight(56),
         child: FahadAppBar(title: AppBarText(title: 'Categories',),),
         ),
    );
  }
}

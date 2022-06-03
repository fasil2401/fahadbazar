import 'package:flutter/material.dart';

import '../../Components/app_bar.dart';
import '../../Components/app_bar_text.dart';
import '../../constants/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: commonScaffoldBack,
      appBar: PreferredSize(
         preferredSize: Size.fromHeight(56),
         child: FahadAppBar(title: AppBarText(title: 'Notifications',),),
         ),
    );
  }
}
import 'package:fahadbazar/Presentation/Components/section_head.dart';
import 'package:fahadbazar/Presentation/Screens/support/components/support_tile.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/notifications.dart';
import 'package:fahadbazar/Presentation/constants/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sizer/sizer.dart';

import '../../Components/appbar_inner.dart';
import '../../Components/positioned_bitton.dart';
import '../../constants/colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: commonScaffoldBack,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarInner(
          title: 'Edit profile',
          visible: false,
          cart: false,
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: _h,
            child: Padding(
              padding: commonHorizontalPadding,
              child: ListView(
                shrinkWrap: true,
                children: [
                  commonHeight4,
                  CircleAvatar(
                    radius: 15.w,
                    child: Image.asset('assets/images/user.png'),
                  ),
                  commonHeight5,
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(color: mutedColor),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: mutedColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: mutedBlueColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  commonHeight2,
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Phone number',
                      labelStyle: TextStyle(color: mutedColor),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: mutedColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: mutedBlueColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  commonHeight2,
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: mutedColor),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: mutedColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: mutedBlueColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          PositionedButton(
            sw: sw,
            text: 'Save changes',
            check: '',
          )
        ],
      ),
    );
  }
}

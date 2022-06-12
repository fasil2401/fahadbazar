import 'package:fahadbazar/Presentation/Components/section_head.dart';
import 'package:fahadbazar/Presentation/Screens/support/components/support_tile.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/notifications.dart';
import 'package:fahadbazar/Presentation/constants/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sizer/sizer.dart';

import '../../Components/appbar_inner.dart';
import '../../constants/colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  final String text =
      'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.';

  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
     double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: commonScaffoldBack,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarInner(
          title: 'About Us',
          visible: false,
          cart: false,
        ),
      ),
      body: Padding(
        padding: commonHorizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonHeight2,
            const SectionHeadText(
              title: 'About us',
              tail: false,
            ),
            commonHeight2,
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                    fontFamily: 'Rubik', fontSize: 10.sp, color: mutedColor),
              ),
            ),
            SupportTile(sw: sw, title: 'Privacy policy', icon: 'privacy'),
            commonHeight2,
            SupportTile(sw: sw, title: 'Terms and conditions', icon: 'terms'),
            commonHeight5
          ],
        ),
      ),
    );
  }
}

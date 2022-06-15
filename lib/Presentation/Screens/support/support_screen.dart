import 'package:fahadbazar/Presentation/constants/border_radius.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../Components/appbar_inner.dart';
import '../../constants/colors.dart';
import 'components/support_tile.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: commonScaffoldBack,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarInner(
          title: 'Support',
          visible: false,
          cart: false,
        ),
      ),
      body: Padding(
        padding: commonHorizontalPadding,
        child: SizedBox(
          height: sh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              commonHeight5,
              Center(
                child: SizedBox(
                  width: sw * 0.16,
                  child: Image.asset(
                    'assets/images/support.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              commonHeight3,
              headText(sw),
              commonHeight4,
              GestureDetector(
                onTap: (){
                  _callNumber();
                },
                  child: SupportTile(
                sw: sw,
                title: 'Touch with us',
                icon: 'phone',
              )),
              commonHeight2,
              SupportTile(
                sw: sw,
                title: 'Mail us',
                icon: 'mail',
              ),
              commonHeight2,
              SupportTile(
                sw: sw,
                title: 'Explore website',
                icon: 'web',
              ),
              commonHeight2,
              SupportTile(
                sw: sw,
                title: 'Reach us',
                icon: 'reach',
              ),
              // commonHeight2,
            ],
          ),
        ),
      ),
    );
  }

  SizedBox headText(double sw) {
    return SizedBox(
      width: sw * 0.5,
      child: Text(
        'How can we help you ?',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: supportColor,
            fontFamily: 'Rubik',
            fontSize: 18.sp,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  _callNumber() async{
  const number = '8590385573'; //set the number here
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}
}

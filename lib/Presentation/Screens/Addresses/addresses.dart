import 'package:fahadbazar/Presentation/Components/positioned_bitton.dart';
import 'package:fahadbazar/Presentation/Components/section_head.dart';
import 'package:fahadbazar/Presentation/constants/border_radius.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../Components/appbar_inner.dart';
import '../../constants/colors.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
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
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: commonHorizontalPadding,
              child: ListView(
                shrinkWrap: true,
                children: [
                  commonHeight2,
                  const SectionHeadText(
                    title: 'Saved Addresses',
                    tail: false,
                  ),
                  commonHeight1,
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: cartRadius, color: Colors.white),
                          child: Padding(
                            padding: cartCardPadding,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset('assets/icons/address/work.svg'),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Work',
                                      style: TextStyle(
                                          fontFamily: 'Rubik', fontSize: 14.sp),
                                    ),
                                    commonHeight1,
                                    const Text(
                                      '9745640896',
                                      style: TextStyle(
                                          color: mutedColor, fontFamily: 'Rubik'),
                                    ),
                                    const Text(
                                      'ERE business solutions, cyberpark,',
                                      style: TextStyle(
                                          color: mutedColor, fontFamily: 'Rubik'),
                                    ),
                                    const Text(
                                      'kozhikode, kerala,673636',
                                      style: TextStyle(
                                          color: mutedColor, fontFamily: 'Rubik'),
                                    ),

                                  commonHeight1,
                                  Row(
                                    children: [
                                      Container(
                                        height: 27,
                                        width: 27,
                                        decoration: BoxDecoration(
                                          color: textBlueColor,
                                          borderRadius: BorderRadius.circular(7)
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset('assets/icons/account/edit.svg', color: Colors.white,),
                                        ),
                                      ),
                                      SizedBox(
                                  width: 3.w,
                                ),
                                      Container(
                                        height: 27,
                                        width: 27,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 246, 39, 24),
                                          borderRadius: BorderRadius.circular(7)
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset('assets/icons/address/remove.svg', color: Colors.white,),
                                        ),
                                      )
                                    ],
                                  )
                                  ],
                                  
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => commonHeight1,
                      itemCount: 10),
                      commonHeight5,
                      commonHeight5,
                      commonHeight5,
                ],
              ),
              
            ),
          ),
          PositionedButton(sw: sw, text: 'Add new Address',check: 'add',)
        ],
      ),
    );
  }
}

import 'package:fahadbazar/Presentation/Components/appbar_inner.dart';
import 'package:fahadbazar/Presentation/Components/positioned_bitton.dart';
import 'package:fahadbazar/Presentation/Components/section_head.dart';
import 'package:fahadbazar/Presentation/Screens/cart%20screen/components/cart_text.dart';
import 'package:fahadbazar/Presentation/constants/colors.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/paddings.dart';
import 'package:fahadbazar/logic/Controller/api/Address/address_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/enums/cart_enum.dart';

class AddAddress extends StatelessWidget {

  final addressController = Get.put(AddressController());
  AddAddress({Key? key}) : super(key: key);
  Address _address = Address.home;
  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: commonScaffoldBack,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarInner(
          title: 'Add new Address',
          visible: false,
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: commonHorizontalPadding,
              child: ListView(
                children: [
                  CupertinoTextField(
                    decoration: textFieldDecoration(),
                    onChanged: (value) {
                      addressController.setName(value);
                    },
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Enter Your Name',
                    placeholderStyle: textFieldHintStyle(),
                    padding: textFieldPadding(),
                  ),
                  commonHeight2,
                  CupertinoTextField(
                    decoration: textFieldDecoration(),
                    onChanged: (value) {
                      addressController.setPhone(value);
                    },
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Enter your phone number',
                    placeholderStyle: textFieldHintStyle(),
                    padding: textFieldPadding(),
                  ),
                  commonHeight2,
                  CupertinoTextField(
                    decoration: textFieldDecoration(),
                    onChanged: (value) {
                      addressController.setEmail(value);
                    },
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Enter your mail',
                    placeholderStyle: textFieldHintStyle(),
                    padding: textFieldPadding(),
                  ),
                  commonHeight2,
                  CupertinoTextField(
                    maxLines: 5,
                    decoration: textFieldDecoration(),
                    onChanged: (value) {
                      addressController.setAddress(value);
                    },
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Enter your address',
                    placeholderStyle: textFieldHintStyle(),
                    padding: textFieldPadding(),
                  ),
                  commonHeight2,
                  CupertinoTextField(
                    decoration: textFieldDecoration(),
                    onChanged: (value) {
                      addressController.setLandmark(value);
                    },
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Enter your landmark',
                    placeholderStyle: textFieldHintStyle(),
                    padding: textFieldPadding(),
                  ),
                  commonHeight2,
                  CupertinoTextField(
                    decoration: textFieldDecoration(),
                    onChanged: (value) {
                      addressController.setPincode(value);
                    },
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Enter your pincode',
                    placeholderStyle: textFieldHintStyle(),
                    padding: textFieldPadding(),
                  ),
                  commonHeight2,
                  CupertinoTextField(
                    decoration: textFieldDecoration(),
                    onChanged: (value) {
                      addressController.setCity(value);
                    },
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Enter your city',
                    placeholderStyle: textFieldHintStyle(),
                    padding: textFieldPadding(),
                  ),
                  commonHeight2,
                  CupertinoTextField(
                    decoration: textFieldDecoration(),
                    onChanged: (value) {
                      addressController.setDistrict(value);
                    },
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Enter your district',
                    placeholderStyle: textFieldHintStyle(),
                    padding: textFieldPadding(),
                  ),
                  commonHeight2,
                  CupertinoTextField(
                    decoration: textFieldDecoration(),
                    onChanged: (value) {
                      addressController.setState(value);
                    },
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Enter your state',
                    placeholderStyle: textFieldHintStyle(),
                    padding: textFieldPadding(),
                  ),
                  commonHeight3,
                  const SectionHeadText(
                    title: 'Address type',
                    tail: false,
                  ),
                  commonHeight2,
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio<Address>(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => textBlueColor),
                            focusColor: MaterialStateColor.resolveWith(
                                (states) => textBlueColor),
                            value: Address.home,
                            groupValue: _address,
                            onChanged: (value) {
                              _address = value!;
                            },
                          ),
                          radioText(sw, 'Home')
                        ],
                      ),
                      
                      Row(
                        children: [
                          Radio<Address>(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => textBlueColor),
                            focusColor: MaterialStateColor.resolveWith(
                                (states) => textBlueColor),
                            value: Address.work,
                            groupValue: _address,
                            onChanged: (value) {
                              _address = value!;
                            },
                          ),
                          radioText(sw, 'Work')
                        ],
                      )
                    ],
                  ),
                  commonHeight5,
                  commonHeight5,
                  commonHeight5,
                ],
              ),
            ),
          ),
          PositionedButton(text: 'Save', sw: sw, check: 'addAddress',)
        ],
      ),
    );
  }

  Text radioText(double sw, String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 0.04 * sw,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  EdgeInsets textFieldPadding() =>
      EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h);

  BoxDecoration textFieldDecoration() {
    return BoxDecoration(
      color: textFieldColor,
      borderRadius: BorderRadius.circular(8),
    );
  }

  TextStyle textFieldHintStyle() {
    return TextStyle(
        color: CupertinoColors.placeholderText,
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w200,
        fontSize: 14.sp);
  }
}

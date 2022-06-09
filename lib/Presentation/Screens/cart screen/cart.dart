import 'dart:ui';

import 'package:fahadbazar/Presentation/Components/appbar_inner.dart';
import 'package:fahadbazar/Presentation/Components/common_button.dart';
import 'package:fahadbazar/Presentation/Components/section_head.dart';
import 'package:fahadbazar/Presentation/Screens/cart%20screen/components/cart_text.dart';
import 'package:fahadbazar/Presentation/constants/border_radius.dart';
import 'package:fahadbazar/Presentation/constants/colors.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/paddings.dart';
import 'package:fahadbazar/logic/enums/cart_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Components/positioned_bitton.dart';
import 'components/address_details.dart';
import 'components/address_head.dart';
import 'components/address_name.dart';
import 'components/cart_adjust_button.dart';
import 'components/cart_bill.dart';
import 'components/cart_items.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  Payment _payment = Payment.cash;
  Address _address = Address.home;
  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: commonScaffoldBack,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarInner(
          title: 'Cart',
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
                  commonHeight1,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: cartRadius,
                    ),
                    child: Padding(
                      padding: cartCardPadding,
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return CartItems(
                              sw: sw,
                              text: 'Pears soap',
                            );
                          },
                          separatorBuilder: (context, index) {
                            return commonHeight2;
                          },
                          itemCount: 2),
                    ),
                  ),
                  commonHeight3,
                  const SectionHeadText(
                    title: 'Bill Details',
                    tail: false,
                  ),
                  commonHeight1,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: cartRadius,
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: cartCardPadding,
                      child: CartBill(sw: sw),
                    ),
                  ),
                  commonHeight3,
                  const SectionHeadText(
                    title: 'Payment Options',
                    tail: false,
                  ),
                  commonHeight1,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: cartRadius,
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: cartCardPadding,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CartNameText(
                                  sw: sw, text: 'Would you like to pay online'),
                              Radio<Payment>(
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => textBlueColor),
                                focusColor: MaterialStateColor.resolveWith(
                                    (states) => textBlueColor),
                                value: Payment.online,
                                groupValue: _payment,
                                onChanged: (value) {
                                  _payment = value!;
                                },
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CartNameText(
                                  sw: sw,
                                  text:
                                      'Would yu like to pay cash on delivery'),
                              Radio<Payment>(
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => textBlueColor),
                                focusColor: MaterialStateColor.resolveWith(
                                    (states) => textBlueColor),
                                value: Payment.cash,
                                groupValue: _payment,
                                onChanged: (value) {
                                  _payment = value!;
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  commonHeight3,
                  const SectionHeadText(
                    title: 'Delivery Address',
                    tail: false,
                  ),
                  commonHeight1,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: cartRadius,
                    ),
                    child: Padding(
                      padding: cartCardPadding,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                             const Expanded(
                                child: AddressDetails(
                                  type: 'Home',
                                ),
                              ),
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
                              )
                            ],
                          ),
                          commonHeight2,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: AddressDetails(
                                  type: 'Office',
                                ),
                              ),
                              Radio<Address>(
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => textBlueColor),
                                focusColor: MaterialStateColor.resolveWith(
                                    (states) => textBlueColor),
                                value: Address.office,
                                groupValue: _address,
                                onChanged: (value) {
                                  _address = value!;
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  commonHeight2,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: cartRadius,
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: cartCardPadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        const AddressName(text: 'Add new Address',) ,
                         GestureDetector(
                           onTap: (){
                             Get.toNamed('/address');
                           },
                           child: SvgPicture.asset('assets/icons/add_circle.svg')),
                        ],
                      ),
                    ),
                  ),
                  commonHeight5,
                  commonHeight5,
                  commonHeight5,
                ],
              ),
            ),
          ),
          PositionedButton(sw: sw, text: 'Buy now',),
          
        ],
      ),
    );
  }
}

import 'package:fahadbazar/Presentation/Components/positioned_bitton.dart';
import 'package:fahadbazar/Presentation/Components/section_head.dart';
import 'package:fahadbazar/Presentation/Screens/Add%20Address/add_address.dart';
import 'package:fahadbazar/Presentation/Screens/Addresses/address_empty.dart';
import 'package:fahadbazar/Presentation/Screens/Notification/components/notification_shimmer.dart';
import 'package:fahadbazar/Presentation/constants/border_radius.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/paddings.dart';
import 'package:fahadbazar/logic/Controller/api/Address/address_controller.dart';
import 'package:fahadbazar/models/Address/address_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Components/appbar_inner.dart';
import '../../constants/colors.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({Key? key}) : super(key: key);
  final addressController = Get.put(AddressController());

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
      body: Obx(() {
        // addressController.getAddressList();
        if (!addressController.isLoading.value) {
          return addressController.addressList.isEmpty
              ? AddressEmptyBody()
              : Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Padding(
                        padding: commonHorizontalPadding,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            commonHeight2,
                            const SectionHeadText(
                              title: 'Saved Addresses',
                              tail: false,
                            ),
                            commonHeight1,
                            ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: addressController.addressList.length,
                              itemBuilder: (context, index) {
                                var address =
                                    addressController.addressList[index];
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: cartRadius,
                                      color: Colors.white),
                                  child: Padding(
                                    padding: cartCardPadding,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/address/work.svg'),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              address.type,
                                              style: TextStyle(
                                                  fontFamily: 'Rubik',
                                                  fontSize: 14.sp),
                                            ),
                                            commonHeight1,
                                            Text(
                                              address.phone,
                                              style: const TextStyle(
                                                  color: mutedColor,
                                                  fontFamily: 'Rubik'),
                                            ),
                                            Text(
                                              address.landmark,
                                              style: const TextStyle(
                                                  color: mutedColor,
                                                  fontFamily: 'Rubik'),
                                            ),
                                            Text(
                                              '${address.district}, ${address.state},${address.pincode}',
                                              style: TextStyle(
                                                  color: mutedColor,
                                                  fontFamily: 'Rubik'),
                                            ),
                                            commonHeight1,
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.to(() => AddAddress(
                                                          address: address,
                                                          status: 'edit',
                                                        ));
                                                  },
                                                  child: Container(
                                                    height: 27,
                                                    width: 27,
                                                    decoration: BoxDecoration(
                                                        color: textBlueColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7)),
                                                    child: Center(
                                                      child: SvgPicture.asset(
                                                        'assets/icons/account/edit.svg',
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Container(
                                                  height: 27,
                                                  width: 27,
                                                  decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 246, 39, 24),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7)),
                                                  child: Center(
                                                    child: SvgPicture.asset(
                                                      'assets/icons/address/remove.svg',
                                                      color: Colors.white,
                                                    ),
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
                              separatorBuilder: (context, index) =>
                                  commonHeight1,
                            ),
                            commonHeight5,
                            commonHeight5,
                            commonHeight5,
                          ],
                        ),
                      ),
                    ),
                    PositionedButton(
                      sw: sw,
                      text: 'Add new Address',
                      check: 'add',
                      onPressed: () {
                        Get.to(() => AddAddress(
                              address: Address(
                                  name: '',
                                  phone: '',
                                  email: '',
                                  address: '',
                                  city: '',
                                  state: '',
                                  landmark: '',
                                  pincode: '',
                                  district: ''),
                              status: 'add',
                            ));
                      },
                    )
                  ],
                );
        } else {
          return NotificationShimmer(w: sw);
        }
      }),
    );
  }
}

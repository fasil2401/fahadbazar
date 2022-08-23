import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fahadbazar/Presentation/Components/appbar_inner.dart';
import 'package:fahadbazar/Presentation/Components/product_slide.dart';
import 'package:fahadbazar/Presentation/Components/section_head.dart';
import 'package:fahadbazar/Presentation/Screens/Home/components/carousel.dart';
import 'package:fahadbazar/Presentation/Screens/Home/components/carousel_shimmer.dart';
import 'package:fahadbazar/Presentation/Screens/Home/components/product_slider_shimmer.dart';
import 'package:fahadbazar/Presentation/Screens/Single%20Page/components/product_name_text.dart';
import 'package:fahadbazar/Presentation/Screens/Single%20Page/components/single_page.dart';
import 'package:fahadbazar/Presentation/constants/colors.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/paddings.dart';
import 'package:fahadbazar/logic/Controller/api/home_controller.dart';
import 'package:fahadbazar/logic/Controller/api/product_single_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Components/common_button.dart';
import 'components/product_name_row.dart';

class SinglePage extends StatelessWidget {
  SinglePage({Key? key, this.productId = 0, this.offer = ''}) : super(key: key);
  int productId;
  String offer;
  List<String> defaultunit = ['Not available'];
  String? selectedValue;
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final productDetailsController =
        Get.put(ProductSinglePageController(productId: productId));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: Obx(
          () => AppBarInner(
            visible: false,
            title: productDetailsController.product.value.name,
          ),
        ),
      ),
      body: Obx(
        () => productDetailsController.isLoading.value == true
            ? SinglePageShimmer(w: w)
            : ListView(
                shrinkWrap: true,
                children: [
                  // coverImage(),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(() => productDetailsController.productImages.isNotEmpty
                      ? CarouselSinglePage(
                          list: productDetailsController.productImages,
                        )
                      : CarouselShimmer(
                          w: w,
                        )),
                  commonHeight1,
                  Padding(
                    padding: commonHorizontalPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => ProductNameRow(
                            productName:
                                productDetailsController.product.value.name,
                            availability:
                                productDetailsController.product.value.status!,
                            offer: offer,
                          ),
                        ),
                        commonHeight1,
                        Row(
                          children: [
                            Obx(() {
                              return Flexible(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    // isExpanded: true,
                                    hint: Text(
                                      'Unit:',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: commonBlack,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w500),
                                    ),
                                    items: productDetailsController.unitList
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                //overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    value: productDetailsController
                                                .selectedUnit.value !=
                                            ''
                                        ? productDetailsController
                                            .selectedUnit.value
                                        : selectedValue,
                                    onChanged: (value) {
                                      selectedValue = value as String;
                                      productDetailsController
                                          .selectUnit(value);
                                    },
                                    icon: SvgPicture.asset(
                                        'assets/icons/drop_down.svg'),
                                    iconSize: 14,
                                    iconEnabledColor: Colors.yellow,
                                    iconDisabledColor: Colors.grey,
                                    buttonHeight: 30,
                                    // buttonWidth: 80,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 12, right: 12),
                                    buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      // border: Border.all(
                                      //   color: Colors.black26,
                                      // ),
                                      color: mutedBackColor,
                                    ),
                                    buttonElevation: 2,
                                    itemHeight: 40,
                                    itemPadding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    // dropdownMaxHeight: 200,
                                    // dropdownWidth: 100,
                                    // dropdownPadding: null,
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: mutedBackColor,
                                    ),
                                    dropdownElevation: 8,
                                    scrollbarRadius: const Radius.circular(40),
                                    scrollbarThickness: 6,
                                    scrollbarAlwaysShow: true,
                                    offset: const Offset(0, 0),
                                  ),
                                ),
                              );
                            }),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                width: w * 0.3,
                                decoration: BoxDecoration(
                                  color: textFieldColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          productDetailsController
                                              .decrementQuantity();
                                        },
                                        child: SvgPicture.asset(
                                          'assets/icons/substract.svg',
                                          height: 8.w,
                                          width: 8.w,
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          // width: 40,
                                          child: Center(
                                              child: Obx(
                                            () => Text(productDetailsController
                                                .quantity.value
                                                .toString()),
                                          )),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          productDetailsController
                                              .incrementQuantity();
                                        },
                                        child: SvgPicture.asset(
                                          'assets/icons/add.svg',
                                          height: 8.w,
                                          width: 8.w,
                                        ),
                                      )
                                    ],
                                  ),
                                )),

                            // dropDownButton('Qty:'),
                          ],
                        ),
                        commonHeight2,
                        Obx(
                          () => ProductNameText(
                              title:
                                  'MRP : ₹${productDetailsController.product.value.offerprice}'),
                        ),
                        Obx(
                          () => OfferPrice(
                            price: productDetailsController.product.value.price,
                          ),
                        ),
                        commonHeight3,
                        const SectionHeadText(
                          title: 'Quick overview',
                          tail: false,
                        ),
                        commonHeight1,
                        Obx(
                          () => overviewText(
                              productDetailsController.product.value.desc),
                        ),
                        commonHeight3,
                        const SectionHeadText(
                          title: 'Similar Products',
                          tail: false,
                        ),
                        commonHeight1,
                        // const ProductSlider(),
                        Obx(() => productDetailsController
                                .similarProducts.isNotEmpty
                            ? SimilarProductSlider(
                                list: productDetailsController.similarProducts,
                                catList: homeController.categories,
                              )
                            : ProductShimmer(
                                w: w,
                              )),
                        commonHeight4,
                        addToCartButton(),
                        commonHeight2,
                        CommonButton(text: 'Buy Now', onPressed: () {}),
                        commonHeight5
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }

  Text overviewText(String text) {
    return Text(
      text,
      style: TextStyle(fontFamily: 'Rubik', fontSize: 12.sp),
    );
  }

  Container addToCartButton() {
    return Container(
      width: double.infinity,
      height: 6.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment(-0.95, 0.0),
          end: Alignment(0.5, 0.0),
          colors: [Color(0xff1A2859), Color(0xff3F489E)],
          stops: [0.0, 1.5],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              onPrimary: mutedBlueColor,
              //side: BorderSide(width: 3.0, color: Colors.transparent,),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              primary: commonScaffoldBack),
          child: Text(
            'Add to cart',
            style: TextStyle(
                fontFamily: "Rubik", fontSize: 14.sp, color: textBlueColor),
          ),
        ),
      ),
    );
  }

  Container coverImage() {
    return Container(
      width: double.infinity,
      height: 30.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/banner_images/banner1.jpeg',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

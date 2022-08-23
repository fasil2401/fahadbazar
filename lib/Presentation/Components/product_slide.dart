import 'package:fahadbazar/Presentation/Screens/Single%20Page/single_page.dart';
import 'package:fahadbazar/Presentation/constants/colors.dart';
import 'package:fahadbazar/constants/api_const.dart';
import 'package:fahadbazar/logic/Controller/api/product_single_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProductSlider extends StatelessWidget {
  ProductSlider({
    Key? key,
    required this.list,
    required this.catList,
  }) : super(key: key);

  final List<dynamic> list;
  final List<dynamic> catList;

  findCategory(int id) {
    for (var i = 0; i < catList.length; i++) {
      if (catList[i].id == id) {
        return catList[i].name;
      }
    }
  }

  findOfferPercent(int price, int offer) {
    return ((price - offer) / price) * 100;
  }

  @override
  Widget build(BuildContext context) {
    print(list);
    double width = MediaQuery.of(context).size.width;
    return LimitedBox(
      maxHeight: 0.4 * width,
      child: ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          String catName = findCategory(list[index].catId);
          final offer =
              findOfferPercent(list[index].price, list[index].offerprice);
          return GestureDetector(
            onTap: () {
              print('pressinngggggg');
              Get.to(() => SinglePage(
                    productId: list[index].id,
                    offer: offer.toInt().toString(),
                  ));
            },
            child: Stack(
              children: [
                SizedBox(
                  width: 44.w,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 41.w,
                      height: 0.37 * width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 185, 182, 182),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                            '${ApiConstants.imageUrl}/${list[index].image}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 41.w,
                    height: 0.13 * width,
                    decoration: BoxDecoration(
                        color: commonBlack.withOpacity(0.7),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Column(
                        children: [
                          productName(list[index].name.toString(),
                              list[index].offerprice.toString()),
                          categoryName(catName, list[index].price.toString())
                        ],
                      ),
                    ),
                  ),
                ),
                offerTag(offer.toInt().toString()),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 3.w,
        ),
      ),
    );
  }

  Positioned offerTag(String offer) {
    print(offer);
    return Positioned(
      right: 0,
      child: CircleAvatar(
        backgroundColor: textBlueColor,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${offer}%',
                style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'off',
                style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row categoryName(String name, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 11.sp,
              color: mutedColor,
            ),
          ),
        ),
        Text(
          '₹${price}',
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            fontFamily: 'Rubik',
            fontSize: 11.sp,
            color: mutedColor,
          ),
        )
      ],
    );
  }

  Row productName(String name, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontFamily: 'Rubik', fontSize: 14.sp, color: textFieldColor),
          ),
        ),
        Flexible(
          child: Text(
            '₹${price}',
            style: TextStyle(
                fontFamily: 'Rubik', fontSize: 14.sp, color: textFieldColor),
          ),
        )
      ],
    );
  }
}

class SimilarProductSlider extends StatelessWidget {
  SimilarProductSlider({
    Key? key,
    required this.list,
    required this.catList,
  }) : super(key: key);
  final productDetailsController = Get.put(ProductSinglePageController());
  final List<dynamic> list;
  final List<dynamic> catList;

  findCategory(int id) {
    for (var i = 0; i < catList.length; i++) {
      if (catList[i].id == id) {
        return catList[i].name;
      }
    }
  }

  findOfferPercent(int price, int offer) {
    return ((price - offer) / price) * 100;
  }

  @override
  Widget build(BuildContext context) {
    print(list);
    double width = MediaQuery.of(context).size.width;
    return LimitedBox(
      maxHeight: 0.4 * width,
      child: ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          String catName = findCategory(list[index].catId);
          final offer =
              findOfferPercent(list[index].price, list[index].offerprice);
          return GestureDetector(
            onTap: () {
              productDetailsController.getProductDetails(list[index].id);
              // Get.to(() => SinglePage(
              //       productId: list[index].id,
              //       offer: offer.toInt().toString(),
              //     ));
            },
            child: Stack(
              children: [
                SizedBox(
                  width: 44.w,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 41.w,
                      height: 0.37 * width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 185, 182, 182),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                            '${ApiConstants.imageUrl}/${list[index].image}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 41.w,
                    height: 0.13 * width,
                    decoration: BoxDecoration(
                        color: commonBlack.withOpacity(0.7),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Column(
                        children: [
                          productName(list[index].name.toString(),
                              list[index].offerprice.toString()),
                          categoryName(catName, list[index].price.toString())
                        ],
                      ),
                    ),
                  ),
                ),
                offerTag(offer.toInt().toString()),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 3.w,
        ),
      ),
    );
  }

  Positioned offerTag(String offer) {
    print(offer);
    return Positioned(
      right: 0,
      child: CircleAvatar(
        backgroundColor: textBlueColor,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${offer}%',
                style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'off',
                style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row categoryName(String name, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 11.sp,
              color: mutedColor,
            ),
          ),
        ),
        Text(
          '₹${price}',
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            fontFamily: 'Rubik',
            fontSize: 11.sp,
            color: mutedColor,
          ),
        )
      ],
    );
  }

  Row productName(String name, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontFamily: 'Rubik', fontSize: 14.sp, color: textFieldColor),
          ),
        ),
        Flexible(
          child: Text(
            '₹${price}',
            style: TextStyle(
                fontFamily: 'Rubik', fontSize: 14.sp, color: textFieldColor),
          ),
        )
      ],
    );
  }
}

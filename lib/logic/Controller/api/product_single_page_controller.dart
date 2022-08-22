import 'package:fahadbazar/Services/common_api_services/api_services.dart';
import 'package:fahadbazar/constants/api_const.dart';
import 'package:fahadbazar/models/product_single_model/product_single_model.dart';
import 'package:get/get.dart';

class ProductSinglePageController extends GetxController {
  final int productId;
  ProductSinglePageController({required this.productId});
  @override
  void onInit() {
    super.onInit();
    getProductDetails();
  }

  var isLoading = true.obs;
  var message = ''.obs;
  var status = ''.obs;
  var product = Product(name: '', desc: '').obs;
  var units = [].obs;
  var category = ''.obs;
  var subCategory = ''.obs;
  var similarProducts = [].obs;

  getProductDetails() async {
    try {
      isLoading.value = true;
      var feedback = await ApiServices()
          .postfetchData('${ApiConstants.product}${productId}');
      print('${ApiConstants.product}${productId}');
      if (feedback != null) {
        // print(feedback);
        var result = SingleProductDetailsModel.fromJson(feedback);
        message.value = result.msg;
        status.value = result.sts;
        product.value = result.product;
        print('product isssssssss${result.product.name}');
      } else {
        message.value = 'failure';
      }
    } finally {
      if (status.value == '01') {
        isLoading.value = false;
        Get.snackbar('Success', 'Product Details');
      } else {
        Get.snackbar('Warning', 'Something went Wrong');
      }
    }
  }
}

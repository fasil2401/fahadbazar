import 'package:fahadbazar/Presentation/constants/snackbar.dart';
import 'package:fahadbazar/Services/common_api_services/api_services.dart';
import 'package:fahadbazar/constants/api_const.dart';
import 'package:fahadbazar/models/product_single_model/product_single_model.dart';
import 'package:get/get.dart';

class ProductSinglePageController extends GetxController {
  final int productId;
  ProductSinglePageController({this.productId = 1});
  @override
  void onInit() {
    super.onInit();
    getProductDetails(productId);
  }

  var isLoading = true.obs;
  var message = ''.obs;
  var status = ''.obs;
  var product = Product(name: '', desc: '').obs;
  var units = [].obs;
  var unitList = [].obs;
  var unitListIndex = 0.obs;
  var selectedUnit = ''.obs;
  var category = ''.obs;
  var subCategory = ''.obs;
  var stockAvalible = 0.obs;
  var similarProducts = [].obs;
  var productImages = [].obs;
  var offerPercent = ''.obs;
  var quantity = 1.obs;

  selectUnit(String value) {
    selectedUnit.value = value;
  }

  incrementQuantity() {
    print(stockAvalible.value);
    if (stockAvalible.value > quantity.value) {
      quantity.value++;
    } else {
      SnackBarService.showErrorSnackBar('Warning', 'No more stock avalible');
    }
  }

  decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  getProductDetails(int productCode) async {
    quantity.value = 1;
    try {
      isLoading.value = true;
      var feedback = await ApiServices()
          .postfetchData('${ApiConstants.product}${productCode}');
      print('${ApiConstants.product}${productId}');
      if (feedback != null) {
        var result = SingleProductDetailsModel.fromJson(feedback);
        message.value = result.msg;
        status.value = result.sts;
        product.value = result.product;
        units.value = result.units;
        unitList.value = result.units.isNotEmpty
            ? result.units.map((x) => x.name).toList()
            : ['No Units'];
        category.value = result.category;
        // subCategory.value = result.subCategory;
        similarProducts.value = result.similarProducts;
        print('product isssssssss${result.product.name}');
      } else {
        message.value = 'failure';
      }
    } finally {
      if (status.value == '01') {
        await generateProductImages();
        stockAvalible.value = product.value.stockAvalible;
        isLoading.value = false;
        Get.snackbar('Success', '${productImages.length}');
      } else {
        Get.snackbar('Warning', 'Something went Wrong');
      }
    }
  }

  generateProductImages() {
    productImages.clear();
    if (product.value.image != '') {
      productImages.add(product.value.image);
    }
    if (product.value.image2 != '') {
      productImages.add(product.value.image2);
    }
    if (product.value.image3 != '') {
      productImages.add(product.value.image3);
    }
    if (product.value.image4 != '') {
      productImages.add(product.value.image4);
    }
  }
}

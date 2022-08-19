import 'package:fahadbazar/Services/User%20Preferences/user_preferences.dart';
import 'package:fahadbazar/Services/common_api_services/api_services.dart';
import 'package:fahadbazar/constants/api_const.dart';
import 'package:fahadbazar/models/Home%20Model/home_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getHome();
  }

  var isLoading = true.obs;
  var message = ''.obs;
  var status = ''.obs;
  var categories = [].obs;
  var banners = [].obs;
  var sbanners = Sbanners(image: '').obs;
  var fbanners = [].obs;
  var popularsProducts = [].obs;
  var trendingProducts = [].obs;
  var bestOffersProducts = [].obs;

  getHome() async {
    int userId = UserSimplePreferences.getUserId() ?? 0;
    try {
      isLoading.value = true;
      var feedback = await ApiServices().postfetchData('${ApiConstants.home}');
      if (feedback != null) {
        // print(feedback.address);
        var result = HomeModel.fromJson(feedback);
        categories.value = result.categories;
        banners.value = result.banners;
        sbanners.value = result.sbanners;
        fbanners.value = result.fbanners;
        popularsProducts.value = result.popularsProducts;
        trendingProducts.value = result.trendingProducts;
        bestOffersProducts.value = result.bestOffersProducts;
        message.value = result.msg;
        status.value = result.sts;
      } else {
        message.value = 'failure';
      }
    } finally {
      if (status.value == '01') {
        isLoading.value = false;
        Get.snackbar('Success', 'Home list fetched successfully');
      } else {
        Get.snackbar('Warning', 'Something went Wrong');
      }
    }
  }
}

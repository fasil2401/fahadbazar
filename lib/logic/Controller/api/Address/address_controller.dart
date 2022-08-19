import 'package:fahadbazar/Presentation/Screens/Addresses/addresses.dart';
import 'package:fahadbazar/Services/AddressServices/create_address_services.dart';
import 'package:fahadbazar/Services/NotificationServices/notification_remote_services.dart';
import 'package:fahadbazar/Services/common_api_services/api_services.dart';
import 'package:fahadbazar/constants/api_const.dart';
import 'package:fahadbazar/models/Address/address_list_model.dart';
import 'package:fahadbazar/models/common_response_model.dart';
import 'package:get/get.dart';

import '../../../../Services/User Preferences/user_preferences.dart';

class AddressController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAddressList();
  }

  var isLoading = true.obs;
  var message = ''.obs;
  var status = ''.obs;
  var addressList = [].obs;
  var name = ''.obs;
  var phone = ''.obs;
  var email = ''.obs;
  var mobile = ' '.obs;
  var pincode = ''.obs;
  var landmark = ''.obs;
  var city = ''.obs;
  var address = ''.obs;
  var district = ''.obs;
  var state = ''.obs;
  var type = ''.obs;

  setName(String name) {
    this.name.value = name;
  }

  setPhone(String phone) {
    this.phone.value = phone;
  }

  setEmail(String email) {
    this.email.value = email;
  }

  setMobile(String mobile) {
    this.mobile.value = mobile;
  }

  setPincode(String pincode) {
    this.pincode.value = pincode;
  }

  setLandmark(String landmark) {
    this.landmark.value = landmark;
  }

  setCity(String city) {
    this.city.value = city;
  }

  setAddress(String address) {
    this.address.value = address;
  }

  setDistrict(String district) {
    this.district.value = district;
  }

  setState(String state) {
    this.state.value = state;
  }

  setType(String type) {
    this.type.value = type;
  }

  final List<String> addressTypes = ["Home", "Work"];
  onClickRadioButton(value) {
    print(value);
    type.value = value;
    update();
  }

  createAddress() async {
    int userId = UserSimplePreferences.getUserId() ?? 0;
    try {
      isLoading.value = true;
      var feedback = await RemoteServicesCreateAddress().createAddress(
          '${ApiConstants.createAddress}?userid=${userId}&name=${name.value}&email=${email.value}&mobile=${mobile.value}&phone=${phone.value}&pincode=${pincode.value}&landmark=${landmark.value}&city=${city.value}&address=${address.value}&district=${district.value}&state=${state.value}&type=${type.value}');

      if (feedback != null) {
        message.value = feedback.msg;
        status.value = feedback.sts;
      } else {
        message.value = 'failure';
      }
    } finally {
      if (status.value == '01') {
        isLoading.value = false;
        Get.snackbar('Success', '${message.value}');
        Get.off(() => AddressScreen());
        getAddressList();
      } else {
        Get.snackbar('Warning', 'Something went Wrong');
      }
    }
  }

  getAddressList() async {
    int userId = UserSimplePreferences.getUserId() ?? 0;
    try {
      isLoading.value = true;
      var feedback = await ApiServices()
          .getfetchData('${ApiConstants.getAddress}?userid=${userId}');
      if (feedback != null) {
        // print(feedback.address);
        var result = AddressListModel.fromJson(feedback);
        addressList.value = result.address;
        message.value = result.msg;
        status.value = result.sts;
      } else {
        message.value = 'failure';
      }
    } finally {
      if (status.value == '01') {
        isLoading.value = false;
        Get.snackbar('Success', 'Address list fetched successfully');
      } else {
        Get.snackbar('Warning', 'Something went Wrong');
      }
    }
  }

  updateAddress(int id) async {
    int userId = UserSimplePreferences.getUserId() ?? 0;
    try {
      isLoading.value = true;
      var feedback = await ApiServices().postfetchData(
          '${ApiConstants.upadateAddress}${id.toString()}?userid=${userId}&name=${name.value}&email=${email.value}&mobile=${mobile.value}&phone=${phone.value}&pincode=${pincode.value}&landmark=${landmark.value}&city=${city.value}&address=${address.value}&district=${district.value}&state=${state.value}&type=${type.value}');
      if (feedback != null) {
        // print(feedback.address);
        var result = CommonResponseModel.fromJson(feedback);
        message.value = result.msg;
        status.value = result.sts;
      } else {
        message.value = 'failure';
      }
    } finally {
      if (status.value == '01') {
        isLoading.value = false;
        Get.snackbar('Success', '${message.value}');
        Get.off(() => AddressScreen());
        getAddressList();
      } else {
        Get.snackbar('Warning', 'Something went Wrong');
      }
    }
  }
}

import 'package:fahadbazar/Services/AddressServices/create_address_services.dart';
import 'package:fahadbazar/Services/NotificationServices/notification_remote_services.dart';
import 'package:get/get.dart';

import '../../../../Services/User Preferences/user_preferences.dart';

class AddressController extends GetxController {
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
  var type = 'Work'.obs;

  setName(String name){
    this.name.value = name;
  }
  setPhone(String phone){
    this.phone.value = phone;
  }
  setEmail(String email){
    this.email.value = email;
  }
  setMobile(String mobile){
    this.mobile.value = mobile;
  }
  setPincode(String pincode){
    this.pincode.value = pincode;
  }
  setLandmark(String landmark){
    this.landmark.value = landmark;
  }
  setCity(String city){
    this.city.value = city;
  }
  setAddress(String address){
    this.address.value = address;
  }
  setDistrict(String district){
    this.district.value = district;
  }
  setState(String state){
    this.state.value = state;
  }
  setType(String type){
    this.type.value = type;
  }

  void createAddress() async {
    try {
      isLoading(true);
      var feedback = await RemoteServicesCreateAddress().createAddress(
          'https://fahadbazar.com/api/address/create?userid=${UserSimplePreferences.getUserId()}&name=${name.value}&email=${email.value}&mobile=${mobile.value}&phone=${phone.value}&pincode=${pincode.value}&landmark=${landmark.value}&city=${city.value}&address=${address.value}&district=${district.value}&state=${state.value}&type=${type.value}');
          print('https://fahadbazar.com/api/address/create?userid=${UserSimplePreferences.getUserId()}&name=${name.value}&email=${email.value}&mobile=${mobile.value}&phone=${phone.value}&pincode=${pincode.value}&landmark=${landmark.value}&city=${city.value}&address=${address.value}&district=${district.value}&state=${state.value}&type=${type.value}');

      if (feedback != null) {
        message.value = feedback.msg; 
        status.value = feedback.sts;
      } else {
        message.value = 'failure';
      }
    } finally {
      isLoading(false);
      if (status.value == '01') {
        print('=================');
        Get.snackbar('Success', 'Address created successfully');
      
      } else {
        Get.snackbar('Warning', 'Something went Wrong');
      }
    }
  }
}
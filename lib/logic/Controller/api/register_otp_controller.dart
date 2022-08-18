import 'package:fahadbazar/Services/remote_register_services.dart';
import 'package:fahadbazar/constants/api_const.dart';
import 'package:get/get.dart';


class RegisterOtpController extends GetxController {
  var isLoading = true.obs;
  var otp = ''.obs;

  void getRegisterOtp({
    required String name,
    required String email,
    required String phone,
  }) async {
    try {
      isLoading(true);
      var feedback = await RemoteServicesRegisterOtp().getRegisterOtp(
          '${ApiConstants.otpVerify}?name=${name}&number=${phone}&email=${email}');
      if (feedback != null) {
        otp.value = feedback.otp;
      } else {
        otp.value = 'failure';
      }
    } finally {
      isLoading(false);
      // print(otp.value);
      // print();
      if (otp.value != 'failure') {
        Get.toNamed('/verification');
      } else {
        Get.snackbar('Warning', 'Inavlid details');
      }
    }
  }
}

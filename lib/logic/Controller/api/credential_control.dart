import 'package:fahadbazar/Services/remote_credential.dart';
import 'package:fahadbazar/constants/api_const.dart';
import 'package:fahadbazar/logic/Controller/api/register_otp_controller.dart';
import 'package:fahadbazar/logic/Controller/form_validation/register_controler.dart';
import 'package:get/get.dart';

final registerControl = Get.put(RegisterController());
final registerApiControl = Get.put(RegisterOtpController());

class CredentialCheckController extends GetxController {
  var isLoading = true.obs;
  var sts = ''.obs;

  void getCredentiaStatusEmail({
    required String email,
  }) async {
    try {
      isLoading(true);
      var feedback = await RemoteServicesCredentials()
          .getStatus('${ApiConstants.checkEmail}?email=${email}');
      if (feedback != null) {
        sts.value = feedback.sts;
      } else {
        sts.value = '';
      }
    } finally {
      isLoading(false);
      // print(otp.value);
      // print();
      print(sts.value);
      if (sts.value == '01') {
        // Get.toNamed('/verification');
        Get.snackbar('Warning', 'email already exist');
      } else {
        getCredentiaStatusPhone(phone: registerControl.phoneControl);
      }
    }
  }

  void getCredentiaStatusPhone({
    required String phone,
  }) async {
    print(phone);
    try {
      isLoading(true);
      var feedback = await RemoteServicesCredentials()
          .getStatus('${ApiConstants.checkPhone}?number=${phone}');
      if (feedback != null) {
        sts.value = feedback.sts;
      } else {
        sts.value = '';
      }
    } finally {
      isLoading(false);
      print(sts.value);
      if (sts.value == '01') {
        Get.snackbar('Warning', 'phone number already exist');
      } else {
        registerApiControl.getRegisterOtp(
            name: registerControl.nameControl,
            email: registerControl.emailControl,
            phone: registerControl.phoneControl);
      }
    }
  }
}

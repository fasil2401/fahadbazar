import 'package:fahadbazar/Services/remote_verify_register.dart';
import 'package:fahadbazar/constants/api_const.dart';
import 'package:fahadbazar/logic/Controller/api/register_otp_controller.dart';
import 'package:get/get.dart';

import '../../../Services/remote_login_services.dart';
import '../../../models/login_register/login_model.dart';

class VerifyController extends GetxController {
  final otpCOntrol = Get.put(RegisterOtpController());
  var isLoading = true.obs;
  var message = ''.obs;
  var user = User();
  // ignore: prefer_typing_uninitialized_variables
  var feedback;
  void getVerify(
      {required String name,
      required String password,
      required String phone,
      required String email,
      required String otp}) async {
    try {
      isLoading(true);
      if (otpCOntrol.otp.value == otp) {
        feedback = await RemoteServicesVerify().getVerify(
            '${ApiConstants.register}?name=${name}&number=${phone}&email=${email}&password=${password}');
      } else {
        feedback = null;
      }
      if (feedback != null) {
        message.value = feedback.msg;
        user = feedback.user;
      } else {
        message.value = 'failure';
      }
    } finally {
      isLoading(false);
      if (message.value == 'Success') {
        Get.offNamed('/login');
      } else {
        Get.snackbar('title', 'message');
      }
    }
  }
}

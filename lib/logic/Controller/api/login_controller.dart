import 'package:get/get.dart';

import '../../../Services/User Preferences/user_preferences.dart';
import '../../../Services/remote_login_services.dart';
import '../../../models/login_register/login_model.dart';

class LoginController extends GetxController {
  var isLoading = true.obs;
  var message = ''.obs;
  var user = User();

  void getLogin(
      {required String emailorphone, required String password}) async {
    try {
      isLoading(true);
      var feedback = await RemoteServicesLogin().getLogin(
          'customer/login?emailormobile=${emailorphone}&password=${password}');
      if (feedback != null) {
        message.value = feedback.msg;
        user = feedback.user;
        
        
      } else {
        message.value = 'failure';
      }
    } finally {
      isLoading(false);
      if (message.value == 'Success') {
        await UserSimplePreferences.setLogin('loggedIn');
        await UserSimplePreferences.setUsername(user.name!);
        await UserSimplePreferences.setUserId(user.id!);
        await UserSimplePreferences.setUserEmail(user.email!);
        await UserSimplePreferences.setUserPhone(user.phone!);
        Get.offNamed('/main');
      } else {
        Get.snackbar('Error', 'Please check your credentials');
      }
    }
  }
}

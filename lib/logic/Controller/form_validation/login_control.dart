import 'package:get/get_state_manager/get_state_manager.dart';

class LoginFormControl extends GetxController{
    var emailorphoneControl = '';
  var passwordControl = '';


  validateEmailorphone(String value) {
      emailorphoneControl = value;
  }
  validatePassword(String value) {
      passwordControl = value;
  }
}


import 'package:get/get.dart';

class PasswordController extends GetxController {
  
  var status = true.obs;
  var icon = 'assets/icons/eye_closed.svg'.obs;

  check(){
    if(status.value == true){
      status.value = false;
      icon.value = 'assets/icons/eye_open.svg';
    }else{
      status.value = true;
      icon.value = 'assets/icons/eye_closed.svg';
    }
  }
}
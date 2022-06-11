

import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  
  var status = true.obs;


  check(bool value){
    if(value == true){
      status.value = false;
    }else{
      status.value = true;
    }
  }
}
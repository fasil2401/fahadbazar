import 'package:fahadbazar/Services/NotificationServices/notification_remote_services.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  var isLoading = true.obs;
  var message = ''.obs;
  var notifications = [].obs;

  void getNotifications() async {
    try {
      isLoading(true);
      var feedback = await RemoteServicesNotifications().getNotifications(
          'notifications');
      if (feedback != null) {
        message.value = feedback.msg;
        notifications.value = feedback.notifications;
        
        
      } else {
        message.value = 'failure';
      }
    } finally {
      isLoading(false);
      if (message.value == 'Success') {
       
      } else {
        // Get.snackbar('title', 'message');
      }
    }
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fahadbazar/models/login_register/login_model.dart';

import '../../constants/api_const.dart';
import '../../models/Notification Model/notification_model.dart';


class RemoteServicesNotifications {
  Dio? _dio;

  RemoteServicesNotifications(){
    _dio = Dio(
      BaseOptions(baseUrl:ApiConstants.baseUrl )
    );
  }

  Future<dynamic> getNotifications(String endpoint) async{
    try {
      Response response = await _dio!.post(endpoint);
      if (response.statusCode == 200) {
        var decode =jsonDecode(response.data);
        if(decode['sts'] == '00'){
          return null;
        }else{
           NotificationsModel notifications = NotificationsModel.fromJson(decode);
      return notifications;
        }
      }
    }on DioError catch (e) {
      print(e);
    }
    return null;
  }
}
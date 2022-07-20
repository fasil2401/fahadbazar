import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fahadbazar/models/Address/create_address_model.dart';

import '../../constants/api_const.dart';
import '../../models/Notification Model/notification_model.dart';


class RemoteServicesCreateAddress {
  Dio? _dio;

  RemoteServicesCreateAddress(){
    _dio = Dio(
      BaseOptions(baseUrl:ApiConstants.baseUrl )
    );
  }

  Future<dynamic> createAddress(String endpoint) async{
    try {
      Response response = await _dio!.post(endpoint);
      if (response.statusCode == 200) {
        var decode =jsonDecode(response.data);
        if(decode['sts'] == '00'){
          return null;
        }else{
           CreateAddressModel feedback = CreateAddressModel.fromJson(decode);
      return feedback;
        }
      }
    }on DioError catch (e) {
      print(e);
    }
    return null;
  }
}
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fahadbazar/models/login_register/login_model.dart';
import 'package:fahadbazar/models/login_register/register_otp_model.dart';

import '../constants/api_const.dart';

class RemoteServicesCredentials {
  Dio? _dio;

  RemoteServicesCredentials(){
    _dio = Dio(
      BaseOptions(baseUrl:ApiConstants.baseUrl )
    );
  }

  Future<dynamic> getStatus(String endpoint) async{
    try {
      // Response response = await _dio!.post(endpoint, data: {'emailormobile' : 8590385573, 'password' : 43212401});
      Response response = await _dio!.post(endpoint);
      if (response.statusCode == 200) {
        var decode =jsonDecode(response.data);
        if(decode['sts'] == '00'){
          return null;
        }else{
         CheckCredential status = CheckCredential.fromJson(decode);
      return status;
        }
      }
    }on DioError catch (e) {
      print(e);
    }
    return null;
  }
}
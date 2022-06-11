import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fahadbazar/models/login_register/login_model.dart';
import 'package:fahadbazar/models/login_register/register_otp_model.dart';

import '../constants/api_const.dart';
import '../models/login_register/verify_model.dart';

class RemoteServicesVerify {
  Dio? _dio;

  RemoteServicesVerify(){
    _dio = Dio(
      BaseOptions(baseUrl:ApiConstants.baseUrl )
    );
  }

  Future<dynamic> getVerify(String endpoint) async{
    try {
      // Response response = await _dio!.post(endpoint, data: {'emailormobile' : 8590385573, 'password' : 43212401});
      Response response = await _dio!.post(endpoint);
      if (response.statusCode == 200) {
        var decode =jsonDecode(response.data);
        if(decode['sts'] == '00'){
          return null;
        }else{
         Verify registerOtpInfo = Verify.fromJson(decode);
      return registerOtpInfo;
        }
      }
    }on DioError catch (e) {
      print(e);
    }
    return null;
  }
}
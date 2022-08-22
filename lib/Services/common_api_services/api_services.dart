import 'dart:convert';
import 'package:dio/dio.dart';
import '../../constants/api_const.dart';

class ApiServices {
  Dio? _dio;

  ApiServices() {
    _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  }

  Future getfetchData(String endpoint) async {
    print(endpoint);
    try {
      Response response = await _dio!.get(endpoint);
      if (response.statusCode == 200) {
        var decode = jsonDecode(response.data);
        print(decode);
        if (decode['sts'] == '00') {
          return null;
        } else {
          return decode;
        }
      }
    } on DioError catch (e) {
      print(e);
    }
    return null;
  }

  Future postfetchData(String endpoint) async {
    try {
      Response response = await _dio!.post(endpoint);
      if (response.statusCode == 200) {
        // print(response.data);
        var decode = jsonDecode(response.data);
        if (decode['sts'] == '00') {
          return null;
        } else {
          // print('decodeeeeeee$decode');
          return decode;
        }
      }
    } on DioError catch (e) {
      print(e);
    }
    return null;
  }
}

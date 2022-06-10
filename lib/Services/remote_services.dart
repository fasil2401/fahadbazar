import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fahadbazar/models/login_register/login_model.dart';

import '../constants/api_const.dart';

// class RemoteServices {
//    Dio _dio = Dio();

//    RemoteServices(){
//     _dio = Dio(BaseOptions(
//       baseUrl: ApiConstants.baseUrl,
//     ));

//     initializeInterceptors();
//   }


//   Future<Login?> getLogin(String endPoint) async{
//     Response response;
//     Login loginInfo;

//     try {
//       response = await _dio.post(endPoint);
//     } on DioError catch (e) {
//       print(e.message);
//       throw Exception(e.message);
//     }
//     try {

//       if (response.statusCode == 200) {
       
//           loginInfo = Login.fromJson(response.data);
//           print(loginInfo);
//           return loginInfo;
        
//       } else {
//         print("There is some problem status code not 200");
//       }
//     } on Exception catch (e) {
//       print(e);
//     }
//     return null;

//   }
//  initializeInterceptors(){
//     _dio.interceptors.add(InterceptorsWrapper(
//       onError: (DioError e, handler) {
    
//      return  handler.next(e);//continue
   
//     },
//       onRequest:(options, handler){
     
//      return handler.next(options); //continue
//     },
//     onResponse:(response,handler) {
//      return handler.next(response); // continue
//     },
//     ));
//   }
// }

class RemoteServicesLogin {
  Dio? _dio;

  RemoteServicesLogin(){
    _dio = Dio(
      BaseOptions(baseUrl:ApiConstants.baseUrl )
    );
  }

  Future<dynamic> getLogin(String endpoint) async{
    try {
      // Response response = await _dio!.post(endpoint, data: {'emailormobile' : 8590385573, 'password' : 43212401});
      Response response = await _dio!.post(endpoint);
      if (response.statusCode == 200) {
        var decode =jsonDecode(response.data);
        if(decode['sts'] == '00'){
          return null;
        }else{
         Login loginInfo = Login.fromJson(decode);
      return loginInfo;
        }
      }
    }on DioError catch (e) {
      print(e);
    }
    return null;
  }
}
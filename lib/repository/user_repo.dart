


import 'package:cricstreamer/data/network/base_api_service.dart';
import 'package:cricstreamer/data/network/network_api_service.dart';
import 'package:cricstreamer/res/app_url.dart';

class UserRepo {
  BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi (dynamic data,dynamic headers)async{
    try{
      dynamic response = await _apiService.getPostApiResponse(AppUrl.loginEndPoint, data, headers);
      return response;
    }catch(e){
      throw e;
    }
  }
  Future<dynamic> signUpApi (dynamic data,dynamic headers)async{
    try{
      dynamic response = await _apiService.getPostApiResponse(AppUrl.signUpEndPoint, data,headers);
      return response;
    }catch(e){
      throw e;
    }
  }
  Future<dynamic> resetPassword (dynamic data, dynamic headers) async {
    try{
      dynamic response = await _apiService.getPostApiResponse(AppUrl.resetPasswordEndPoint, data, headers);
      return response;
    }catch (e){
      throw e;
    }
  }
  Future<dynamic> verifyOtp (dynamic data, dynamic headers) async {
    try{
      dynamic response = await _apiService.getPostApiResponse(AppUrl.verifyOtpEndPoint, data, headers);
      return response;
    }catch (e){
      throw e;
    }
  }
  Future<dynamic> changePassword (dynamic data, dynamic headers) async {
    try{
      dynamic response = await _apiService.getPostApiResponse(AppUrl.changePasswordEndPoint, data, headers);
      return response;
    }catch (e){
      throw e;
    }
  }
}
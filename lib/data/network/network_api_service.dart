

import 'dart:convert';
import 'dart:io';

import 'package:cricstreamer/data/app_exceptions.dart';
import 'package:cricstreamer/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService implements BaseApiService{
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try{
        final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 100000));
        responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException("No internet connection.");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, data, headers) async {
    dynamic responseJson;
    try{
      final response = await http.post(Uri.parse(url), body:data, headers: headers).timeout(Duration(seconds: 10000));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException("No internet connection.");
    }
    return responseJson;
  }

  @override
  Future getDeleteApiResponse(String url)async{
    dynamic responseJson;
    try{
      final response = await http.delete(Uri.parse(url)).timeout(Duration(seconds: 1000000));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException("No internet connection.");
    }
    return responseJson;
  }

  @override
  Future getPutApiResponse(String url, data) async{
    dynamic responseJson;
    try{
      final response = await http.put(Uri.parse(url), body:data).timeout(Duration(seconds: 10000));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException("No internet connection.");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException('Error accured while communicating with server'+
            'with status code' +response.statusCode.toString());
    }
  }
  
}

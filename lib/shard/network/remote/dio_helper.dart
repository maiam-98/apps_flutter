 import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper
{

  static late Dio dio;

//create object of the Dio.
  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        //baseUrl: 'https://student.valuxapps.com/api/',
        //even if data is wrong , pass it on.
        receiveDataWhenStatusError: true,
      ),
    );
   /* (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };*/
  }

 static Future<Response> getData({
 required String url,
  Map<String , dynamic>? query,
   String? token,
   String lang = 'en',
})async
  {
    dio.options.headers = {
      'Content-Type':'application/json',
      'lang': lang,
      'Authorization': token??'',
    };
   return await dio.get(url, queryParameters: query,);

  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
    String lang = 'en',

})async
  {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token
    };
    return  dio.post(
        url,
        queryParameters: query,
        data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
    String lang = 'en',

  })async
  {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token
    };
    return  dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
import 'package:dio/dio.dart';

class MyDio {
  static Dio? dio;

  static InitMyDio() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true));
  }

  static Future<Response> PostData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? qury,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    return await dio!.post(
      url,
      data: data,
      queryParameters: qury,
    );
  }

  static Future<Response> PutDio(
      {required path,
      Map<String, dynamic>? data,
      token,
      lang,
      Map<String, dynamic>? q}) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token
    };
    return await dio!.put(path, data: data, queryParameters: q);
  }

//
  static Future<Response> GetDio(
      {required Path, Map<String, dynamic>? QuaryData, token, lang}) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    return await dio!.get(Path, queryParameters: QuaryData);
    // }
  }
}

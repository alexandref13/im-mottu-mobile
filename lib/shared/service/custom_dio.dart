import 'package:dio/dio.dart';

class CustomDio {
  Dio dio = Dio(BaseOptions(
    baseUrl: 'http://gateway.marvel.com/v1/public',
    connectTimeout: 5000,
  ));
}

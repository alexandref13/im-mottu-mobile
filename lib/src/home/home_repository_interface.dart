import 'package:dio/dio.dart';

abstract class IHomeRepository {
  Future<Response> getCharacters({int page});
  Future<Response> getSearchCharacters({required String search});
}

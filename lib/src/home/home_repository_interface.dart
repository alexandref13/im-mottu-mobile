import 'package:dio/dio.dart';

abstract class IHomeRepository {
  Future<Response> getCharacters();
  Future<Response> getSearchCharacters({required String search});
}

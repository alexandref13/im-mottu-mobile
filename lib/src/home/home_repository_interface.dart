import 'package:dio/dio.dart';

abstract class IHomeRepository {
  Future<Response> getCharacters();
  Future<Response> getCharactersWithPagination({
    int page,
    String? search,
  });
  Future<Response> getSearchCharacters({required String search});
}

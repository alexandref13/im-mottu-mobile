import 'package:dio/dio.dart';
import 'package:mottu/shared/helpers/url_helper.dart';
import 'package:mottu/shared/service/custom_dio.dart';
import 'package:mottu/shared/service/dio_cache.dart';
import 'package:mottu/src/home/home_repository_interface.dart';

class HomeRepository implements IHomeRepository {
  Dio dio = CustomDio().dio;
  DioCache dioCache = DioCache();
  UrlHelper urlHelper = UrlHelper();

  @override
  Future<Response> getCharacters() async {
    //NOTE -> Ultimos personagens que foram modificados na api da Marvel

    String finalUrl = urlHelper.generateUrl(
      path: 'characters',
      params: '&limit=20',
    );

    dio.interceptors.add(dioCache.dioCacheManager.interceptor);

    return await dio.get('/$finalUrl', options: dioCache.cacheOptions);
  }

  @override
  Future<Response> getCharactersWithPagination({
    int page = 2,
    String? search,
  }) async {
    //NOTE -> Ultimos personagens que foram modificados na api da Marvel

    var limit = page * 20;

    String finalUrl = search == null
        ? urlHelper.generateUrl(
            path: 'characters',
            params: '&limit=$limit',
          )
        : urlHelper.generateUrl(
            path: 'characters',
            params: '&limit=$limit&nameStartsWith=$search',
          );

    return await dio.get('/$finalUrl');
  }

  @override
  Future<Response> getSearchCharacters({required String search}) async {
    String finalUrl = urlHelper.generateUrl(
      path: 'characters',
      params: '&limit=20&nameStartsWith=$search',
    );
    return await dio.get('/$finalUrl');
  }
}

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
    String finalUrl =
        urlHelper.generateUrl(path: 'characters', params: '&orderBy=modified');

    dio.interceptors.add(dioCache.dioCacheManager.interceptor);

    return await dio.get('/$finalUrl', options: dioCache.cacheOptions);
  }

  @override
  Future<Response> getSearchCharacters({required String search}) async {
    String finalUrl = urlHelper.generateUrl(
      path: 'characters',
      params: '&orderBy=modified&nameStartsWith=$search',
    );
    return await dio.get('/$finalUrl');
  }
}

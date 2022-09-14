import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class DioCache {
  //NOTE -> Cache com Dio durando 3 dias
  DioCacheManager dioCacheManager = DioCacheManager(
    CacheConfig(
      baseUrl: 'http://gateway.marvel.com/v1/public',
      defaultRequestMethod: 'GET',
    ),
  );
  Options cacheOptions = buildCacheOptions(
    const Duration(days: 3),
  );
}

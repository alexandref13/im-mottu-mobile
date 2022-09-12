import 'package:dio/dio.dart';
import 'package:mottu/shared/helpers/url_helper.dart';
import 'package:mottu/shared/service/custom_dio.dart';

class HomeRepository {
  Dio dio = CustomDio().dio;
  UrlHelper urlHelper = UrlHelper();

  Future getCharacters() async {
    String finalUrl =
        urlHelper.generateUrl(path: 'characters', params: '&limit=50');
    return await dio.get('/$finalUrl');
  }
}

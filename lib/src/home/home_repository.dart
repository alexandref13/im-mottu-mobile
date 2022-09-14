import 'package:dio/dio.dart';
import 'package:mottu/shared/helpers/url_helper.dart';
import 'package:mottu/shared/service/custom_dio.dart';

class HomeRepository {
  Dio dio = CustomDio().dio;
  UrlHelper urlHelper = UrlHelper();

  Future getCharacters() async {
    //Note -> Ultimos personagens que foram modificidos na api da Marvel

    String finalUrl =
        urlHelper.generateUrl(path: 'characters', params: '&orderBy=modified');
    return await dio.get('/$finalUrl');
  }

  Future getSearchCharacters({required String search}) async {
    String finalUrl = urlHelper.generateUrl(
      path: 'characters',
      params: '&orderBy=modified&nameStartsWith=$search',
    );
    return await dio.get('/$finalUrl');
  }
}

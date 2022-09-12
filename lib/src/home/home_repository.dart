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

  Future getCharactersById({required String id}) async {
    String finalUrl = urlHelper.generateUrl(path: 'characters/$id');
    return await dio.get('/$finalUrl');
  }
}

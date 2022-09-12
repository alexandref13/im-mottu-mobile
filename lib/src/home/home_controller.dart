import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mottu/shared/models/character_model.dart';
import 'package:mottu/src/home/home_repository.dart';

class HomeController extends GetxController {
  HomeRepository homeRepository = HomeRepository();

  var isLoading = false.obs;

  var errorMessage = ''.obs;

  var charactersList = <CharacterModel>[].obs;

  getCharacters() async {
    isLoading(true);
    try {
      await homeRepository.getCharacters().then((value) {
        List data = value.data['data']['results'];
        var list = data.map((model) => CharacterModel.fromJson(model)).toList();

        charactersList.clear();
        charactersList.value = list;

        isLoading(false);
      });
    } on DioError catch (err) {
      errorMessage.value = err.response!.data['message'].toString();
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getCharacters();
    super.onInit();
  }
}

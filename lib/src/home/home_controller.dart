import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mottu/shared/models/character_model.dart';
import 'package:mottu/src/home/home_repository.dart';

import '../../shared/service/dio_cache.dart';

class HomeController extends GetxController {
  HomeRepository homeRepository = HomeRepository();
  DioCache dioCache = DioCache();

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var charactersList = <CharacterModel>[].obs;
  var searchController = TextEditingController().obs;

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
      errorMessage.value = err.response?.data['status'];
      isLoading(false);
    }
  }

  getSearchCharacters({required String search}) async {
    isLoading(true);

    try {
      await homeRepository.getSearchCharacters(search: search).then((value) {
        List data = value.data['data']['results'];
        var list = data.map((model) => CharacterModel.fromJson(model)).toList();

        charactersList.clear();
        charactersList.value = list;
        isLoading(false);
      });
    } on DioError catch (err) {
      errorMessage.value = err.response!.data['status'];
      isLoading(false);
    }
  }

  handleDeleteCache() async {
    // UrlHelper urlHelper = UrlHelper();

    // String finalUrl =
    //     urlHelper.generateUrl(path: 'characters', params: '&orderBy=modified');
    // bool response = await dioCache.dioCacheManager.deleteByPrimaryKey(
    //   '/$finalUrl',
    // );

    final response = await dioCache.dioCacheManager.clearAll();

    print(response);
  }

  @override
  void onInit() {
    getCharacters();
    super.onInit();
  }
}

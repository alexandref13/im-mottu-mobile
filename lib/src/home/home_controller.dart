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

  var page = 2;

  late ScrollController scrollController;

  Future<void> getCharacters() async {
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

  Future<void> getCharactersWithPagination({
    int page = 2,
    String? search,
  }) async {
    try {
      await homeRepository
          .getCharactersWithPagination(
        page: page,
        search: search,
      )
          .then((value) {
        List data = value.data['data']['results'];
        var list = data.map((model) => CharacterModel.fromJson(model)).toList();

        charactersList.clear();
        charactersList.value = list;
      });
    } on DioError catch (err) {
      errorMessage.value = err.response?.data['status'];
    }
  }

  Future<void> getSearchCharacters({required String search}) async {
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
    await dioCache.dioCacheManager.clearAll();
  }

  void scrollListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      if (page <= 5) {
        page = ++page;

        if (searchController.value.text.isNotEmpty) {
          getCharactersWithPagination(
            page: page,
            search: searchController.value.text,
          );
        } else {
          getCharactersWithPagination(
            page: page,
          );
        }
      }
    }
  }

  @override
  void onInit() {
    getCharacters();
    scrollController = ScrollController();

    super.onInit();
  }
}

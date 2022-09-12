import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:mottu/shared/helpers/key_helper.dart';

class UrlHelper {
  String hash = '';
  DateTime timeStamp = DateTime.now();

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  generateHash() {
    hash = generateMd5(
      timeStamp.toIso8601String() +
          KeyHelper.privateApiKey +
          KeyHelper.publicApiKey,
    );
  }

  generateUrl({
    required String path,
    String params = '',
  }) {
    generateHash();
    String url =
        '$path?apikey=${KeyHelper.publicApiKey}&hash=$hash&ts=${timeStamp.toIso8601String()}$params';

    return url;
  }
}

import 'dart:developer';

import 'package:dio/dio.dart';
import '../../constants/string.dart';

class CharactersWebServices {
  Dio? dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );

    dio = Dio(options);
  }

  Future<Map<String, dynamic>> getAllCharacter() async {
    try {
      Response response = await dio!.get("character");
      // log(response.data.toString());
      return response.data;
    } catch (e) {
      log(e.toString());
      return {};
    }
  }
}

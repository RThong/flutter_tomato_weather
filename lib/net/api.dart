import 'package:dio/dio.dart';

import 'base.dart';

const baseURL = 'https://aider.meizu.com/app/weather/listWeather';

getWeather() async {
  Response response =
      await dio.get(baseURL, queryParameters: {'cityIds': '101210101'});
  return response.data;
  ;
}

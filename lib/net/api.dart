import 'package:dio/dio.dart';

import 'base.dart';
import 'dart:math';

const baseURL = 'https://aider.meizu.com/app/weather/listWeather';

getWeather({num areaid}) async {
  Response response =
      await dio.get(baseURL, queryParameters: {'cityIds': '$areaid'});
  return response.data;
}

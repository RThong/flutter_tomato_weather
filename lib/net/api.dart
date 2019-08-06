import 'package:dio/dio.dart';

import 'base.dart';
import 'dart:math';

const baseURL = 'https://aider.meizu.com/app/weather/listWeather';

getWeather() async {
  // 对重新获取数据并渲染进行测试
  var random = new Random().nextBool() ? '101210101' : '101240101';
  print(random);
  Response response =
      await dio.get(baseURL, queryParameters: {'cityIds': random});
  return response.data;
  ;
}

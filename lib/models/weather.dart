import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class WeatherRes {
  final String code;
  final String message;
  final String redirect;

  final List<WeatherInfo> value;

  WeatherRes({this.code, this.message, this.redirect, this.value});

  factory WeatherRes.fromJson(Map<String, dynamic> json) =>
      _$WeatherResFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherResToJson(this);
}

@JsonSerializable()
class WeatherInfo {
  final List<Alarms> alarms;
  final String city;
  final int cityid;
  final List<WeatherSuggest> indexes;
  final PM25 pm25;
  final String provinceName;
  final RealTime realtime;
  final WeatherDetailsInfo weatherDetailsInfo;
  final List<Weather7DaysInfo> weathers;

  WeatherInfo(
      {this.alarms,
      this.city,
      this.cityid,
      this.indexes,
      this.pm25,
      this.provinceName,
      this.realtime,
      this.weatherDetailsInfo,
      this.weathers});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherInfoToJson(this);
}

@JsonSerializable()
class Alarms {
  final String alarmContent;
  final String alarmDesc;
  final String alarmId;
  final String alarmLevelNo;
  final String alarmLevelNoDesc;
  final String alarmType;
  final String alarmTypeDesc;
  final String precaution;
  final String publishTime;

  Alarms(
      {this.alarmContent,
      this.alarmDesc,
      this.alarmId,
      this.alarmLevelNo,
      this.alarmLevelNoDesc,
      this.alarmType,
      this.alarmTypeDesc,
      this.precaution,
      this.publishTime});

  factory Alarms.fromJson(Map<String, dynamic> json) => _$AlarmsFromJson(json);
  Map<String, dynamic> toJson() => _$AlarmsToJson(this);
}

@JsonSerializable()
class WeatherSuggest {
  final String abbreviation;
  final String alias;
  final String content;
  final String level;
  final String name;

  WeatherSuggest(
      {this.abbreviation, this.alias, this.content, this.level, this.name});

  factory WeatherSuggest.fromJson(Map<String, dynamic> json) =>
      _$WeatherSuggestFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherSuggestToJson(this);
}

@JsonSerializable()
class PM25 {
  final String advice;
  final String aqi;
  final int citycount;
  final int cityrank;
  final String co;
  final String color;
  final String level;
  final String no2;
  final String o3;
  final String pm10;
  final String pm25;
  final String quality;
  final String so2;
  final String timestamp;
  final String upDateTime;
  PM25(
      {this.advice,
      this.aqi,
      this.citycount,
      this.cityrank,
      this.co,
      this.color,
      this.level,
      this.no2,
      this.o3,
      this.pm10,
      this.pm25,
      this.quality,
      this.so2,
      this.timestamp,
      this.upDateTime});

  factory PM25.fromJson(Map<String, dynamic> json) => _$PM25FromJson(json);
  Map<String, dynamic> toJson() => _$PM25ToJson(this);
}

@JsonSerializable()
class RealTime {
  final String img;
  final String sD;
  final String sendibleTemp;
  final String temp;
  final String time;
  final String wD;
  final String wS;
  final String weather;
  final String ziwaixian;
  RealTime(
      {this.img,
      this.sD,
      this.sendibleTemp,
      this.temp,
      this.time,
      this.wD,
      this.wS,
      this.weather,
      this.ziwaixian});

  factory RealTime.fromJson(Map<String, dynamic> json) =>
      _$RealTimeFromJson(json);
  Map<String, dynamic> toJson() => _$RealTimeToJson(this);
}

@JsonSerializable()
class WeatherDetailsInfo {
  final String publishTime;
  final List<Weather3HoursInfo> weather3HoursDetailsInfos;
  WeatherDetailsInfo({this.publishTime, this.weather3HoursDetailsInfos});

  factory WeatherDetailsInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherDetailsInfoFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDetailsInfoToJson(this);
}

@JsonSerializable()
class Weather3HoursInfo {
  final String endTime;
  final String highestTemperature;
  final String img;
  final String isRainFall;
  final String lowerestTemperature;
  final String precipitation;
  final String startTime;
  final String wd;
  final String weather;
  final String ws;

  Weather3HoursInfo(
      {this.endTime,
      this.highestTemperature,
      this.img,
      this.isRainFall,
      this.lowerestTemperature,
      this.precipitation,
      this.startTime,
      this.wd,
      this.weather,
      this.ws});

  factory Weather3HoursInfo.fromJson(Map<String, dynamic> json) =>
      _$Weather3HoursInfoFromJson(json);
  Map<String, dynamic> toJson() => _$Weather3HoursInfoToJson(this);
}

@JsonSerializable()
class Weather7DaysInfo {
  final String date;
  final String img;
  final String sun_down_time;
  final String sun_rise_time;
  final String temp_day_c;
  final String temp_day_f;
  final String temp_night_c;
  final String temp_night_f;
  final String wd;
  final String weather;
  final String week;
  final String ws;

  Weather7DaysInfo(
      {this.date,
      this.img,
      this.sun_down_time,
      this.sun_rise_time,
      this.temp_day_c,
      this.temp_day_f,
      this.temp_night_c,
      this.temp_night_f,
      this.wd,
      this.weather,
      this.week,
      this.ws});

  factory Weather7DaysInfo.fromJson(Map<String, dynamic> json) =>
      _$Weather7DaysInfoFromJson(json);
  Map<String, dynamic> toJson() => _$Weather7DaysInfoToJson(this);
}

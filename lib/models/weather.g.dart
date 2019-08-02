// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherRes _$WeatherResFromJson(Map<String, dynamic> json) {
  return WeatherRes(
    code: json['code'] as String,
    message: json['message'] as String,
    redirect: json['redirect'] as String,
    value: (json['value'] as List)
        ?.map((e) =>
            e == null ? null : WeatherInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$WeatherResToJson(WeatherRes instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'redirect': instance.redirect,
      'value': instance.value,
    };

WeatherInfo _$WeatherInfoFromJson(Map<String, dynamic> json) {
  return WeatherInfo(
    alarms: (json['alarms'] as List)
        ?.map((e) =>
            e == null ? null : Alarms.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    city: json['city'] as String,
    cityid: json['cityid'] as int,
    indexes: (json['indexes'] as List)
        ?.map((e) => e == null
            ? null
            : WeatherSuggest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pm25: json['pm25'] == null
        ? null
        : PM25.fromJson(json['pm25'] as Map<String, dynamic>),
    provinceName: json['provinceName'] as String,
    realtime: json['realtime'] == null
        ? null
        : RealTime.fromJson(json['realtime'] as Map<String, dynamic>),
    weatherDetailsInfo: json['weatherDetailsInfo'] == null
        ? null
        : WeatherDetailsInfo.fromJson(
            json['weatherDetailsInfo'] as Map<String, dynamic>),
    weathers: (json['weathers'] as List)
        ?.map((e) => e == null
            ? null
            : Weather7DaysInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$WeatherInfoToJson(WeatherInfo instance) =>
    <String, dynamic>{
      'alarms': instance.alarms,
      'city': instance.city,
      'cityid': instance.cityid,
      'indexes': instance.indexes,
      'pm25': instance.pm25,
      'provinceName': instance.provinceName,
      'realtime': instance.realtime,
      'weatherDetailsInfo': instance.weatherDetailsInfo,
      'weathers': instance.weathers,
    };

Alarms _$AlarmsFromJson(Map<String, dynamic> json) {
  return Alarms(
    alarmContent: json['alarmContent'] as String,
    alarmDesc: json['alarmDesc'] as String,
    alarmId: json['alarmId'] as String,
    alarmLevelNo: json['alarmLevelNo'] as String,
    alarmLevelNoDesc: json['alarmLevelNoDesc'] as String,
    alarmType: json['alarmType'] as String,
    alarmTypeDesc: json['alarmTypeDesc'] as String,
    precaution: json['precaution'] as String,
    publishTime: json['publishTime'] as String,
  );
}

Map<String, dynamic> _$AlarmsToJson(Alarms instance) => <String, dynamic>{
      'alarmContent': instance.alarmContent,
      'alarmDesc': instance.alarmDesc,
      'alarmId': instance.alarmId,
      'alarmLevelNo': instance.alarmLevelNo,
      'alarmLevelNoDesc': instance.alarmLevelNoDesc,
      'alarmType': instance.alarmType,
      'alarmTypeDesc': instance.alarmTypeDesc,
      'precaution': instance.precaution,
      'publishTime': instance.publishTime,
    };

WeatherSuggest _$WeatherSuggestFromJson(Map<String, dynamic> json) {
  return WeatherSuggest(
    abbreviation: json['abbreviation'] as String,
    alias: json['alias'] as String,
    content: json['content'] as String,
    level: json['level'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$WeatherSuggestToJson(WeatherSuggest instance) =>
    <String, dynamic>{
      'abbreviation': instance.abbreviation,
      'alias': instance.alias,
      'content': instance.content,
      'level': instance.level,
      'name': instance.name,
    };

PM25 _$PM25FromJson(Map<String, dynamic> json) {
  return PM25(
    advice: json['advice'] as String,
    aqi: json['aqi'] as String,
    citycount: json['citycount'] as int,
    cityrank: json['cityrank'] as int,
    co: json['co'] as String,
    color: json['color'] as String,
    level: json['level'] as String,
    no2: json['no2'] as String,
    o3: json['o3'] as String,
    pm10: json['pm10'] as String,
    pm25: json['pm25'] as String,
    quality: json['quality'] as String,
    so2: json['so2'] as String,
    timestamp: json['timestamp'] as String,
    upDateTime: json['upDateTime'] as String,
  );
}

Map<String, dynamic> _$PM25ToJson(PM25 instance) => <String, dynamic>{
      'advice': instance.advice,
      'aqi': instance.aqi,
      'citycount': instance.citycount,
      'cityrank': instance.cityrank,
      'co': instance.co,
      'color': instance.color,
      'level': instance.level,
      'no2': instance.no2,
      'o3': instance.o3,
      'pm10': instance.pm10,
      'pm25': instance.pm25,
      'quality': instance.quality,
      'so2': instance.so2,
      'timestamp': instance.timestamp,
      'upDateTime': instance.upDateTime,
    };

RealTime _$RealTimeFromJson(Map<String, dynamic> json) {
  return RealTime(
    img: json['img'] as String,
    sD: json['sD'] as String,
    sendibleTemp: json['sendibleTemp'] as String,
    temp: json['temp'] as String,
    time: json['time'] as String,
    wD: json['wD'] as String,
    wS: json['wS'] as String,
    weather: json['weather'] as String,
    ziwaixian: json['ziwaixian'] as String,
  );
}

Map<String, dynamic> _$RealTimeToJson(RealTime instance) => <String, dynamic>{
      'img': instance.img,
      'sD': instance.sD,
      'sendibleTemp': instance.sendibleTemp,
      'temp': instance.temp,
      'time': instance.time,
      'wD': instance.wD,
      'wS': instance.wS,
      'weather': instance.weather,
      'ziwaixian': instance.ziwaixian,
    };

WeatherDetailsInfo _$WeatherDetailsInfoFromJson(Map<String, dynamic> json) {
  return WeatherDetailsInfo(
    publishTime: json['publishTime'] as String,
    weather3HoursDetailsInfos: (json['weather3HoursDetailsInfos'] as List)
        ?.map((e) => e == null
            ? null
            : Weather3HoursInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$WeatherDetailsInfoToJson(WeatherDetailsInfo instance) =>
    <String, dynamic>{
      'publishTime': instance.publishTime,
      'weather3HoursDetailsInfos': instance.weather3HoursDetailsInfos,
    };

Weather3HoursInfo _$Weather3HoursInfoFromJson(Map<String, dynamic> json) {
  return Weather3HoursInfo(
    endTime: json['endTime'] as String,
    highestTemperature: json['highestTemperature'] as String,
    img: json['img'] as String,
    isRainFall: json['isRainFall'] as String,
    lowerestTemperature: json['lowerestTemperature'] as String,
    precipitation: json['precipitation'] as String,
    startTime: json['startTime'] as String,
    wd: json['wd'] as String,
    weather: json['weather'] as String,
    ws: json['ws'] as String,
  );
}

Map<String, dynamic> _$Weather3HoursInfoToJson(Weather3HoursInfo instance) =>
    <String, dynamic>{
      'endTime': instance.endTime,
      'highestTemperature': instance.highestTemperature,
      'img': instance.img,
      'isRainFall': instance.isRainFall,
      'lowerestTemperature': instance.lowerestTemperature,
      'precipitation': instance.precipitation,
      'startTime': instance.startTime,
      'wd': instance.wd,
      'weather': instance.weather,
      'ws': instance.ws,
    };

Weather7DaysInfo _$Weather7DaysInfoFromJson(Map<String, dynamic> json) {
  return Weather7DaysInfo(
    date: json['date'] as String,
    img: json['img'] as String,
    sun_down_time: json['sun_down_time'] as String,
    sun_rise_time: json['sun_rise_time'] as String,
    temp_day_c: json['temp_day_c'] as String,
    temp_day_f: json['temp_day_f'] as String,
    temp_night_c: json['temp_night_c'] as String,
    temp_night_f: json['temp_night_f'] as String,
    wd: json['wd'] as String,
    weather: json['weather'] as String,
    week: json['week'] as String,
    ws: json['ws'] as String,
  );
}

Map<String, dynamic> _$Weather7DaysInfoToJson(Weather7DaysInfo instance) =>
    <String, dynamic>{
      'date': instance.date,
      'img': instance.img,
      'sun_down_time': instance.sun_down_time,
      'sun_rise_time': instance.sun_rise_time,
      'temp_day_c': instance.temp_day_c,
      'temp_day_f': instance.temp_day_f,
      'temp_night_c': instance.temp_night_c,
      'temp_night_f': instance.temp_night_f,
      'wd': instance.wd,
      'weather': instance.weather,
      'week': instance.week,
      'ws': instance.ws,
    };

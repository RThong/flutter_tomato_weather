import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'models/weather.dart';
import 'utils/helper.dart';

class WeatherChart extends StatelessWidget {
  List<Weather7DaysInfo> weather;

  WeatherChart({this.weather}) {
    // print(this.weather);
    if (this.weather != null) {
      // print(this
      //     .weather
      //     .map((_) => DataPoint<double>(value: double.parse(_.temp_day_c)))
      //     .toList());
      // print(this.weather.length);
    }
  }

  Widget build(BuildContext context) {
    // List<double> a = [0, 5, 10, 15, 20, 25];
    if (this.weather == null) {
      return Container(width: 0, height: 0);
    }
    return BezierChart(
      bezierChartScale: BezierChartScale.CUSTOM,
      xAxisCustomValues:
          new List<double>.generate(this.weather.length, (i) => 1.0 * i),
      footerValueBuilder: (double value) {
        if (value == 0.0) {
          return '今';
        } else if (value == 1.0) {
          return '明';
        } else {
          final aaaa = this.weather[value.toInt()].week;
          return aaaa.substring(aaaa.length - 1);
        }
      },
      series: [
        // 最高温度
        BezierLine(
          lineStrokeWidth: 2.0,
          lineColor: Color(0xfff4a875),
          label: "℃",
          data: this
              .weather
              .map((_) => DataPoint<double>(value: double.parse(_.temp_day_c)))
              .toList(),
        ),
        // 最低温度
        BezierLine(
          lineStrokeWidth: 2.0,
          lineColor: Color(0xff80bfe1),
          label: "℃",
          data: this
              .weather
              .map(
                  (_) => DataPoint<double>(value: double.parse(_.temp_night_c)))
              .toList(),
        ),
      ],
      config: BezierChartConfig(
        contentWidth: MediaQuery.of(context).size.width * 0.7,
        // footerHeight: 40,
        verticalIndicatorStrokeWidth: 1.0,
        verticalIndicatorColor: textColor,
        showVerticalIndicator: true,
        verticalIndicatorFixedPosition: false,
        showDataPoints: false,
        // snap: false,
      ),
    );
    // var i = 0;
    // final a = new List<double>.generate(7, (i) => 5.0 * i);
    // return this.weather == null
    //     ? Container(width: 0, height: 0)
    //     : BezierChart(
    //         bezierChartScale: BezierChartScale.CUSTOM,
    //         xAxisCustomValues: a,
    //         // xAxisCustomValues: const [0, 5, 10, 15, 20, 25],
    //         footerValueBuilder: (double value) {
    //           return "今";
    //         },
    //         series: [
    //           // 最高温度
    //           BezierLine(
    //             lineStrokeWidth: 2.0,
    //             lineColor: Color(0xfff4a875),
    //             label: "m",
    //             // data: const [
    //             //   DataPoint<double>(value: 10),
    //             //   DataPoint<double>(value: 130),
    //             //   DataPoint<double>(value: 50),
    //             //   DataPoint<double>(value: 150),
    //             //   DataPoint<double>(value: 75),
    //             //   DataPoint<double>(value: 0),
    //             // ],
    //             data: this
    //                 .weather
    //                 .map((_) =>
    //                     DataPoint<double>(value: double.parse(_.temp_day_c)))
    //                 .toList(),
    //           ),
    //           // 最低温度
    //           BezierLine(
    //             lineStrokeWidth: 2.0,
    //             lineColor: Color(0xff80bfe1),
    //             label: "m",
    //             data: const [
    //               DataPoint<double>(value: 1),
    //               DataPoint<double>(value: 80),
    //               DataPoint<double>(value: 40),
    //               DataPoint<double>(value: 110),
    //               DataPoint<double>(value: 20),
    //               DataPoint<double>(value: 0),
    //             ],
    //           ),
    //         ],
    //         config: BezierChartConfig(
    //           contentWidth: MediaQuery.of(context).size.width * 0.7,
    //           // footerHeight: 40,
    //           verticalIndicatorStrokeWidth: 1.0,
    //           verticalIndicatorColor: textColor,
    //           showVerticalIndicator: true,
    //           verticalIndicatorFixedPosition: false,
    //           showDataPoints: false,
    //           // snap: false,
    //         ),
    //       );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/weather_forecast/util/convert_icon.dart';
import '../model/weather_forecast_model.dart';
import '../util/forecast_util.dart';


Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data?.list;
  var dayOfWeek ="";
  var fullDate = Util.getFormattedDate(
    new DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt * 1000));
  dayOfWeek = fullDate.split(",")[0];
return Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Center(child: Padding(
      padding: const EdgeInsets.all(8),
      child: Text(dayOfWeek),
    ),),
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 33,
          backgroundColor: Colors.white,
          child: getWeatherIcon(weatherDescription: forecastList[index].weather?[0].main,
          color: Colors.blueGrey, size: 45),
        ),
        Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("${forecastList[index].main!.tempMin!.toStringAsFixed(0)}°F"),
            ),
            Icon(FontAwesomeIcons.solidCircleDown, color: Colors.white, size: 17)
            ],

            ),
            Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(0.3),
              child: Text("${forecastList[index].main!.tempMax!.toStringAsFixed(0)}°F"),
            ),
            Icon(FontAwesomeIcons.solidCircleUp, color: Colors.white, size: 17)
            ],

            ),
            Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text("${forecastList[index].main!.humidity!.toStringAsFixed(0)} %"),
            ),
            Icon(FontAwesomeIcons.faceGrinBeamSweat, color: Colors.white, size: 17)
            ],

            ),
            Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text("${forecastList[index].wind?.speed?.toStringAsFixed(0)} mi/h"),
            ),
            Icon(FontAwesomeIcons.wind, color: Colors.white, size: 17)
            ],

            ),
      ],
    )
  ],

  )
      ],
    );
}
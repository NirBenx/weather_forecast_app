// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/weather_forecast/util/convert_icon.dart';
import 'package:weather_forecast/weather_forecast/util/forecast_util.dart';

Widget midView (AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data?.list;
  var city = snapshot.data?.city?.name;
  var country = snapshot.data?.city?.country;
  var formattedDate = DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt * 1000);
  Container midView = Container(
    child: Padding (
      padding: const EdgeInsets.all(14.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$city, $country",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.black87
        ),),
        Text(Util.getFormattedDate(formattedDate), style: const TextStyle(
          fontSize: 15,
        ),
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: getWeatherIcon(weatherDescription: forecastList[0].weather?[0].main, color: Colors.blueAccent
          ,size: 198),
        ),
        //const Icon(FontAwesomeIcons.cloud, size: 198, color: Colors.blueGrey),
        Padding(
          padding: EdgeInsets.symmetric(vertical:12, horizontal: 12.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${forecastList[0].main?.temp.toStringAsFixed(0)}°F ",
              style: TextStyle(fontSize: 34),
              ),
              Text("${forecastList[0].weather?[0].description?.toUpperCase()}", 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ],
          ),
        ),
        
              Padding(
                padding: const EdgeInsets.symmetric(vertical:12.0, horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("${forecastList[0].wind?.speed?.toStringAsFixed(1)} mi/h"),
                        Icon(FontAwesomeIcons.wind, size: 20, color: Colors.blue,)
                        ],
                        //Icon(Icons.arrow_forward_ios, size: 20,color: Colors.brown,)],
                                           
                                         ),
                     ),
                     Row(
                      children: [
                        Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                        children: [
                          Text("${forecastList[0].main?.humidity?.toStringAsFixed(0)} %"),
                          Icon(FontAwesomeIcons.solidFaceGrinBeamSweat, size: 20, color: Colors.blue)
                        ]                       
                        ),
                     )],

                     ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Padding(padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${forecastList[0].main?.tempMax}°F"),
                          Icon(FontAwesomeIcons.temperatureLow, size: 20, color: Colors.blue,)
                        ],
                      ),)
                     ],)
                     ],
                ),
      
              ),
      ],
    ),
    ),
  );  

  return midView;
}

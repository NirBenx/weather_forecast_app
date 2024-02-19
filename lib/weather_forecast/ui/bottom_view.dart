
import 'package:flutter/material.dart';
import '../model/weather_forecast_model.dart';
import 'forecast_card.dart';

Widget bottomView(AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext) {
  var forecastList = snapshot.data?.list;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text("7-Day Weather Forecast".toUpperCase(),
      style: const TextStyle(fontSize: 14,
      color: Colors.black87),),
      Container(
        height: 269,
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: 8),
          itemCount: forecastList!.length,
          itemBuilder: (context, index) => ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(width: MediaQuery.of(context).size.width / 2.5,
          height: 160,
          child: forecastCard(snapshot, index),
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color.fromARGB(255, 30, 7, 147), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight)
          ),)
        ),
         
          ),
      )
    ],
  );
}
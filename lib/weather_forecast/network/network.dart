import 'dart:convert';
import 'package:weather_forecast/weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/weather_forecast/util/forecast_util.dart';
import 'package:http/http.dart';
class Network {
  Future<WeatherForecastModel> getWeatherForecast ({String? cityName}) async {
    var finalUrl = "http://api.openweathermap.org/data/2.5/forecast?q="+cityName!+"&appid="+Util.appId;
    final response = await get(Uri.parse(finalUrl));
    print("URL: ${Uri.encodeFull(finalUrl)}");
    if(response.statusCode == 200) {
      print("Weather Data: ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting weather forecast..");
    }
  }
}
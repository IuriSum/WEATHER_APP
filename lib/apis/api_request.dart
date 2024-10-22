

import 'dart:convert';
// import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:weather_forecast/models/day_model.dart';

class ApiHandler {
  static const String HOURLY_URL = 'https://weatherbit-v1-mashape.p.rapidapi.com/forecast/hourly';
  
  static final Map<String,dynamic> _headers = {
    'x-rapidapi-key': "96a371cb3amsh4448904ca66548ap149af9jsnbdc6addb305b",
    'x-rapidapi-host': "weatherbit-v1-mashape.p.rapidapi.com"
  };

  static Future<Map<String, dynamic>?> weatherForecast120() async {
    try{
      // final Map<String,dynamic> _params = {
      //   "lat" : -25.4284,
      //   "lon" : -49.2733,
      //   "hours" : "120"
      // };

      // Response response = await Dio().get(
      //   HOURLY_URL,
      //   queryParameters: _params,
      //   options: Options(
      //     sendTimeout: Duration(seconds: 30),
      //     receiveTimeout: Duration(seconds: 30),
      //     headers: _headers,
      //     responseType: ResponseType.json
      //   ),
      // );

      // return response.data;
      String asset = await rootBundle.loadString('assets/mocked_response.json');
      return jsonDecode(asset);
    }
    catch(e){
      return null;
      // do nothing
    }
  }

  static Future<List<DayModel>?> generateDaysList()async{
    try{
      List <DayModel> days = [];
      Map<String, dynamic>? requestInfo = await weatherForecast120();
      // weatherForecast120().then((requestInfo){
        List<dynamic> data = requestInfo!["data"]??[];
        // divides request in 3 days
        for (int i = 0; i < 71; i += 24) {
          List<dynamic> sublist = data.sublist(i, i + 24);
          days.add(DayModel(weatherInfo: sublist, city: requestInfo["city_name"]));
        }
        return days;
      // });
    }
    catch(e){
      return null;
    }
  }



}
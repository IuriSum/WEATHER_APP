

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:weather_forecast/core/models/day.dart';

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

      
      // print(response.data);
      // return response.data;
      String asset = await rootBundle.loadString('assets/mocked_response.json');
      print(asset);
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
        List<dynamic> data = requestInfo!["data"];
        if(data.length != 120){
          data = requestInfo["data"].sublist(0, 120);
        }

        for (int i = 0; i < 120; i += 40) {
          days.add(DayModel(weatherInfo: data.sublist(i, i + 40)));
          print(days);
        }
        return days;
      // });
    }
    catch(e){
      return null;
    }
  }



}
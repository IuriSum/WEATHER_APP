

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:weather_forecast/models/day_model.dart';

class ApiHandler {

  // Putting API keys like this is wrong, but for quick testing, I'll leave it.

  static const String HOURLY_URL = 'https://weatherbit-v1-mashape.p.rapidapi.com/forecast/hourly';
  
  static final Map<String,dynamic> _headers = {
    'x-rapidapi-key': "be5efaf143msh585ad4391f6c0e6p19325ajsn4a330c964930",
    'x-rapidapi-host': "weatherbit-v1-mashape.p.rapidapi.com"
  };

  static Future<Map<String, dynamic>?> weatherForecast120() async {
    try{
      final Map<String,dynamic> _params = {
        "lat" : -25.4284,
        "lon" : -49.2733,
        "hours" : "100"
      };

      Response response = await Dio().get(
        HOURLY_URL,
        queryParameters: _params,
        options: Options(
          sendTimeout: Duration(seconds: 30),
          receiveTimeout: Duration(seconds: 30),
          headers: _headers,
          responseType: ResponseType.json
        ),
      );

      return response.data;
      // String asset = await rootBundle.loadString('assets/mocked_response.json');
      // return jsonDecode(asset);
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

      // Group itens by date
      Map<String, List<Map<String, dynamic>>> groupedByDate = {};

      for (var item in requestInfo!["data"]) {
        String date = item['timestamp_local'].split('T')[0];
        if (groupedByDate.containsKey(date)) {
          groupedByDate[date]!.add(item);
        } else {
          groupedByDate[date] = [item];
        }
      }

      // grouping the first 3 days
      List<String> keys = groupedByDate.keys.take(3).toList();
      List<dynamic> result = keys.map((key) => groupedByDate[key]).toList();
      
      // generating our Days List
      for(int i =0; i<result.length; i++){
        days.add(DayModel(weatherInfo: result[i], city: requestInfo["city_name"]));
      }

      return days;
    }
    catch(e){
      return null;
    }
  }



}
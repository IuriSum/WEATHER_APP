
import 'package:weather_forecast/features/constants/weather_consts.dart';

class DayModel {
  final List<dynamic> weatherInfo;
  final String city;

  DayModel({required this.weatherInfo, required this.city});

  late double maxTemp = weatherInfo.map((map) => map['temp']).reduce((a, b) => a > b ? a : b);
  late double minTemp = weatherInfo.map((map) => map['temp']).reduce((a, b) => a < b ? a : b);
  late double precipitation = weatherInfo.map((map) => map['precip'].toDouble()).reduce((a, b) => a > b ? a : b);
  late double currentTemp = _getCurrentTemp();
  late double windSpeed = weatherInfo.map((map) => map['wind_spd']).reduce((a, b) => a > b ? a : b);
  late int uv = weatherInfo.map((map) => map['uv']).reduce((a, b) => a > b ? a : b);
  late DateTime date = _getDate();
  late String currentStatus = _getWeatherStatus();

  double _getCurrentTemp(){
    
    try{
      double temp = weatherInfo.first["temp"]??0.0;
      DateTime now = DateTime.now();
      for (var info in weatherInfo){
        if(DateTime.tryParse(info["timestamp_local"])!.hour == now.hour){
          currentTemp = info["temp"];
        }
      }
      return temp;
    }
    catch(e){
      return  weatherInfo.first["temp"]??0.0;
    }
  }

  DateTime _getDate(){
    return DateTime.parse(weatherInfo.first["timestamp_local"]);
  }

  String _getWeatherStatus(){
    try{
      int code = weatherInfo.first["weather"]["code"];
      DateTime now = DateTime.now();
      String status = "";
      for (var info in weatherInfo){
        if(DateTime.tryParse(info["timestamp_local"])!.hour == now.hour){
          code = info["weather"]["code"];
          for(int i = 0; i < WEATHER_STATUS_CONST.length; i++){
            if(WEATHER_STATUS_CONST[i]["code"] == code){
              status = WEATHER_STATUS_CONST[i]["description"];
            }
          }
        }
      }
      return status;
    }
    catch(e){
      return"";
    }
  }
}
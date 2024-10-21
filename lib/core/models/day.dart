class DayModel {
  List<dynamic> weatherInfo;

  DayModel({required this.weatherInfo});



  late double maxTemp = weatherInfo.map((map) => map['temp']).reduce((a, b) => a > b ? a : b);
  late double minTemp = weatherInfo.map((map) => map['temp']).reduce((a, b) => a < b ? a : b);
}
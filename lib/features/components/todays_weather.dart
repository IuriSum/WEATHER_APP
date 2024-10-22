import 'package:flutter/material.dart';
import 'package:weather_forecast/core/models/day.dart';

class TodaysWeatherBanner extends StatelessWidget {

  final DayModel dayModel;

  const TodaysWeatherBanner({
    super.key,
    required this.dayModel
  });

  String _todaysText(){
    DateTime now = DateTime.now();
    return "${now.day}/${now.month}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 1)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Color.fromARGB(171, 44, 41, 41),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white, width: 1)
            ),
            child: Text(
              dayModel.city,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 12,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Color.fromARGB(171, 44, 41, 41),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white, width: 1)
            ),
            child: Text(
              _todaysText(),
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${dayModel.currentTemp}°",
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                ),
              ),
              Text(
                dayModel.currentStatus,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Spacer(),
              Text(
                "${dayModel.maxTemp}°",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  height: 0
                ),
              ),
               Text(
                "/",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  height: 0
                ),
              ),
              Text(
                "${dayModel.minTemp}°",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  height: 0
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:weather_forecast/models/day_model.dart';

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
        color: Colors.transparent,
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
              color: Colors.transparent,
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
              color: Colors.transparent,
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
          Text(
            "${dayModel.currentTemp}°",
            style: TextStyle(
              fontSize: 80,
              color: Colors.white,
              fontWeight: FontWeight.w600
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                dayModel.currentStatus,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
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
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.water_drop,
                      size: 20,
                      color: Colors.white,
                    ),
                    Text(
                      "${dayModel.precipitation} mm/hr",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        height: 0
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.air,
                      size: 20,
                      color: Colors.white,
                    ),
                    Text(
                      "${(dayModel.windSpeed*3.6).toStringAsFixed(2)} km/h",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        height: 0
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sunny,
                      size: 20,
                      color: Colors.white,
                    ),
                    Text(
                      " UV ${dayModel.uv} (0-11)",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        height: 0
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:weather_forecast/core/models/day.dart';

class WeatherBanner extends StatefulWidget {

  final DayModel dayModel;

  const WeatherBanner({
    super.key,
    required this.dayModel
  });

  @override
  State<WeatherBanner> createState() => _WeatherBannerState();
}

class _WeatherBannerState extends State<WeatherBanner> {

  bool pressed = false;

  String _date(){
    DateTime date = widget.dayModel.date;
    return "${date.day}/${date.month}";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        pressed = !pressed;
      }),
      child: Container(
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
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _date(),
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    height: 0
                  ),
                ),
                Spacer(),
                Text(
                  "${widget.dayModel.maxTemp}°",
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
                  "${widget.dayModel.minTemp}°",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    height: 0
                  ),
                ),
                AnimatedRotation(
                  turns: pressed? 0.5 : 0.0, 
                  duration: Duration(milliseconds: 200),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: 26,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            AnimatedSize(
              duration: Duration(milliseconds: 200),
              child: pressed?
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.water_drop,
                        size: 20,
                        color: Colors.white,
                      ),
                      Text(
                        "${widget.dayModel.precipitation} mm/hr",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          height: 0
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.air,
                        size: 20,
                        color: Colors.white,
                      ),
                      Text(
                        "${(widget.dayModel.windSpeed*3.6).toStringAsFixed(2)} km/h",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          height: 0
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.sunny,
                        size: 20,
                        color: Colors.white,
                      ),
                      Text(
                        " UV ${widget.dayModel.uv} (0-11)",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          height: 0
                        ),
                      ),
                    ],
                  ),
                )
              :
                Container()
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:weather_forecast/core/models/day_model.dart';

class _TodaysWeatherBannerState extends State<TodaysWeatherBanner> {
  bool pressed = false;

  String _todaysText(){
    DateTime now = DateTime.now();
    return "${now.day}/${now.month}";
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Color.fromARGB(171, 44, 41, 41),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white, width: 1)
              ),
              child: Text(
                widget.dayModel.city,
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
            Text(
              "${widget.dayModel.currentTemp}°",
              style: TextStyle(
                fontSize: 80,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.dayModel.currentStatus,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
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
                ),
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

class TodaysWeatherBanner extends StatefulWidget {

  final DayModel dayModel;

  const TodaysWeatherBanner({
    super.key,
    required this.dayModel
  });

  @override
  State<TodaysWeatherBanner> createState() => _TodaysWeatherBannerState();
}
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weather_forecast/apis/api_request.dart';
import 'package:weather_forecast/models/day_model.dart';
import 'package:weather_forecast/features/components/todays_weather.dart';
import 'package:weather_forecast/features/components/weather.dart';



class ClimatePage extends StatelessWidget {
  
  const ClimatePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder(
        future: ApiHandler.generateDaysList(), 
        builder: (BuildContext context, AsyncSnapshot<List<DayModel>?> snapshot){
          
          if(snapshot.hasData && snapshot.data!.isNotEmpty){
            List<DayModel> days = snapshot.data!;
            return SizedBox(
              width: width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TodaysWeatherBanner(dayModel: days[0]),
                  WeatherBanner(dayModel: days[1]),
                  WeatherBanner(dayModel: days[2]),
                ],
              ),
            );
          }
          else{
            return Center(child: LoadingAnimationWidget.discreteCircle(color: Colors.white, size: 34));
          }
          
        }
      )
    );
  }
}

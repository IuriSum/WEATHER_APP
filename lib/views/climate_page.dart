import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weather_forecast/apis/api_request.dart';
import 'package:weather_forecast/features/constants/colors.dart';
import 'package:weather_forecast/models/day_model.dart';
import 'package:weather_forecast/features/components/todays_weather.dart';
import 'package:weather_forecast/features/components/weather.dart';



class ClimatePage extends StatelessWidget {
  
  const ClimatePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height,
     width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 10,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black.withOpacity(0.2), // Tint for status bar
          statusBarIconBrightness: Brightness.light,     // White icons for light theme
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              SKY_BLUE,
              SUNSHINE_YELLOW, 
              CLOUD_GRAY,
            ],
          )
        ),
        child: FutureBuilder(
          future: ApiHandler.generateDaysList(), 
          builder: (BuildContext context, AsyncSnapshot<List<DayModel>?> snapshot){
            
            if(snapshot.hasData && snapshot.data!.isNotEmpty){
              List<DayModel> days = snapshot.data!;
              return SizedBox(
                width: width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: height*0.1,),
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
        ),
      )
    );
  }
}

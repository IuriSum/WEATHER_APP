import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weather_forecast/core/api_request.dart';
import 'package:weather_forecast/core/models/day.dart';



class _ClimatePageState extends State<ClimatePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: FutureBuilder(
        future: ApiHandler.generateDaysList(), 
        builder: (BuildContext context, AsyncSnapshot<List<DayModel>?> snapshot){
          
          if(snapshot.hasData && snapshot.data!.isNotEmpty){
            List<DayModel> days = snapshot.data!;
            return Column(
              children: [
                Row(
                  children: [
                    Text(days[0].maxTemp.toString(), style: TextStyle(color: Colors.white),)
                  ],
                )
              ],
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


class ClimatePage extends StatefulWidget {
  
  const ClimatePage({super.key});

  @override
  _ClimatePageState createState() => _ClimatePageState();
}

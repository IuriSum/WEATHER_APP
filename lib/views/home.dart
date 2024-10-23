
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_forecast/features/constants/colors.dart';
import 'package:weather_forecast/features/constants/routing_consts.dart';

class MyHomePage extends StatelessWidget {

  const MyHomePage({super.key});

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: height*0.4,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                "Selecione o módulo desejado",
                style: TextStyle(
                  fontSize: 40,
                  color: RAINY_BLUE,
                  fontWeight: FontWeight.w600,
                  height: 0
                ),
              ),
            ),
            ElevatedButton(
              onPressed: ()=> Modular.to.pushNamed(CLIMATE),
              child: SizedBox(
                width: 100, 
                child: Text(
                  "Clima", 
                  textAlign: TextAlign.center,
                )
                ),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: ()=> Modular.to.pushNamed(REPORT),
              child: SizedBox(
                width: 100, 
                child: Text(
                  "Relatórios", 
                  textAlign: TextAlign.center,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

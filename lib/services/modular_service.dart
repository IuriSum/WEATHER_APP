import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_forecast/features/constants/routing_consts.dart';
import 'package:weather_forecast/views/climate_page.dart';
import 'package:weather_forecast/views/home.dart';
import 'package:weather_forecast/views/report_page.dart';

class AppModule extends Module {

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(HOME, child: (context) => MyHomePage());
    r.child(CLIMATE, child: (context) => ClimatePage());
    r.child(REPORT, child: (context) => ReportPage());
  }
}
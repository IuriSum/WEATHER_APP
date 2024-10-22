import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/models/report_model.dart';
import 'package:weather_forecast/mobx/report_manager.dart';
import 'package:weather_forecast/services/modular_service.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ReportModelAdapter());
  return runApp(ModularApp(module: AppModule(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ReportManager>(
          create: (_)=> ReportManager(),
        )
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
          useMaterial3: true,
        ),
        routerConfig: Modular.routerConfig,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

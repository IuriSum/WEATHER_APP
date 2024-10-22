
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_forecast/features/constants/routing_consts.dart';

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height,
     width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.black,
      body: SizedBox(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: ()=> Modular.to.pushNamed(CLIMATE),
              child: Text("Clima"),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: ()=> Modular.to.pushNamed(REPORT),
              child: Text("Relatórios"),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

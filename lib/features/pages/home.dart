
import 'package:flutter/material.dart';
import 'package:weather_forecast/features/pages/climate_page.dart';

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    setState(() {
      _tabController = TabController(length: 2, vsync: this);
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height,
     width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: TabBar(
            controller: _tabController,
            labelStyle: TextStyle(color: Colors.white, fontSize: 16),
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Clima",),
              Tab(text: "Registro")
            ]
          ),
      ),
      backgroundColor: Colors.black,
      body: SizedBox(
        width: width,
        child: TabBarView(
          controller: _tabController,
          children: [
            ClimatePage(),
            Container(
              height: 34,
              width: width,
              color: Colors.blue,
            ),
          ] 
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/features/constants/colors.dart';
import 'package:weather_forecast/models/report_model.dart';
import 'package:weather_forecast/features/components/report_card.dart';
import 'package:weather_forecast/mobx/report_manager.dart';

class ReportPage extends StatefulWidget {
  
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  bool canSubmit(){
    return _nameController.text.trim().isNotEmpty && 
      _descriptionController.text.trim().isNotEmpty;
  }

  void errorSnackBar(context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Favor preencher os dados corretamente",
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.w300,
            height: 0,
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height, 
      width = MediaQuery.of(context).size.width;
    final manager = Provider.of<ReportManager>(context);

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
            colors: [
              Color(0xFF1A73E8),
              STORMY_DARK,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: height*0.15,),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16)
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                "Registros de ocorrências",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: STORMY_DARK, 
                  fontSize: 18
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16)
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'Nome'
                    ),
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      hintText: 'Descrição'
                    ),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                      if(canSubmit()){
                        manager.saveNewReport(
                          _nameController.text.trim(), 
                          _descriptionController.text
                        );
                        manager.fetchReports();
                      }
                      else{
                        errorSnackBar(context);
                      }
                    },
                    child: Text("salvar"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16)
              ),
              constraints: BoxConstraints(
                maxHeight: height*0.3
              ),
              padding: EdgeInsets.all(16),
              child: Observer(
                builder: (_) => FutureBuilder(
                  future: manager.reports, 
                  builder: (BuildContext context, AsyncSnapshot<List<ReportModel>?> snapshot){
        
                    if(snapshot.data == null){
                      manager.fetchReports();
                      return Center(child: LoadingAnimationWidget.discreteCircle(
                          color: STORMY_DARK, 
                          size: 34
                        )
                      );
                    }
                    
                    if(snapshot.hasData && snapshot.connectionState == ConnectionState.done){
                      
                      if(snapshot.data!.isEmpty){
                        return SizedBox(
                          width: double.maxFinite,
                          child: Text(
                            "Ainda não há registros salvos!", 
                            style: TextStyle(
                              color: STORMY_DARK, 
                              fontSize: 18
                            ),
                          ),
                        );
                      }
        
                      return ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(0),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext _, int index){
                          return ReportCard(
                            reportModel: snapshot.data![index],
                            deleteCallback: () => manager.deleteReport(index),
                          );
                        },
                        separatorBuilder: (BuildContext _, int index){
                          return SizedBox(height: 8,);
                        },
                      );
                    }
                    else{
                      return Center(
                        child: LoadingAnimationWidget.discreteCircle(
                          color: STORMY_DARK, 
                          size: 34
                        )
                      );
                    }
                    
                  }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

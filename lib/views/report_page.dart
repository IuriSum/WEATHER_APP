import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/core/models/report_model.dart';
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
    openBox();
    super.initState();
  }

  @override
  void dispose(){
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> openBox()async{
    await Hive.openBox<ReportModel>('report_box');
  }


  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height, 
      width = MediaQuery.of(context).size.width;
    final manager = Provider.of<ReportManager>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
          ElevatedButton(onPressed: (){
            manager.saveNewReport(
              _nameController.text.trim(), 
              _descriptionController.text
            );
            manager.fetchReports();
          },
          child: Text("salvar"),),
          Observer(
            builder: (_) => FutureBuilder(
              future: manager.reports, 
              builder: (BuildContext context, AsyncSnapshot<List<ReportModel>?> snapshot){

                if(snapshot.data == null){
                  manager.fetchReports();
                  return Center(child: LoadingAnimationWidget.discreteCircle(color: Colors.white, size: 34));
                }
                
                if(snapshot.hasData && snapshot.connectionState == ConnectionState.done){
                  
                  if(snapshot.data!.isEmpty){
                    return Text("Ainda não há registros salvos!", style: TextStyle(color: Colors.white, fontSize: 18),);
                  }

                  return SizedBox(
                    width: width,
                    height: height*0.60,
                    child: ListView.separated(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext _, int index){
                        return ReportCard(
                          reportModel: snapshot.data![index],
                          deleteCallback: manager.deleteReport(index),
                        );
                      },
                      separatorBuilder: (BuildContext _, int index){
                        return SizedBox(height: 8,);
                      },
                    ),
                  );
                }
                else{
                  return Center(child: LoadingAnimationWidget.discreteCircle(color: Colors.white, size: 34));
                }
                
              }
            ), 
          ),
        ],
      ),
    );
  }
}

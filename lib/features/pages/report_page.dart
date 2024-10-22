import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/core/models/report_model.dart';
import 'package:weather_forecast/core/services/report_service.dart';
import 'package:weather_forecast/mobx/report_manager.dart';



class ReportPage extends StatefulWidget {
  
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {

  final ReportService _reportService = ReportService();

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

  void _save() async{
    ReportModel model = ReportModel(
      name: _nameController.text.trim(),
      description: _descriptionController.text
    );

    model.updateDate();

    print(model.date);
    await _reportService.addReport(model);
    await _reportService.getAllReports();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
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
                
                if(snapshot.hasData && snapshot.connectionState == ConnectionState.done){
                  return SizedBox(
                    width: width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children:[
                        for(int i = 0; i < snapshot.data!.length; i++)
                          Text(
                            snapshot.data![i].name,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white
                            ),
                          )
                      ]
                      ,
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

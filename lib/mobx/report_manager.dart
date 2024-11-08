import 'package:mobx/mobx.dart';
import 'package:weather_forecast/models/report_model.dart';
import 'package:weather_forecast/services/report_service.dart';

part 'report_manager.g.dart';

class  ReportManager  = _ReportManager with _$ReportManager;

abstract class _ReportManager with Store {
  final ReportService _service = ReportService();

  @observable
  Future<List<ReportModel>> reports = Future.value([]) ;

  @action
  Future<dynamic> fetchReports() async {
    reports = _service.getAllReports();
  }

  @action
  Future<dynamic> saveNewReport(String name, String description) async{
    ReportModel model = ReportModel(
      name: name,
      description: description
    );

    model.updateDate();

    await _service.addReport(model);
    fetchReports(); //updates the data stored
  }

  @action
  Future<dynamic> deleteReport(int index) async{
    await _service.deleteReport(index);
    fetchReports(); //updates the data stored
  }
}
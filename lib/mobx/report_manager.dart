import 'package:mobx/mobx.dart';
import 'package:weather_forecast/core/models/report_model.dart';
import 'package:weather_forecast/core/services/report_service.dart';

part 'report_manager.g.dart';

class  ReportManager  = _ReportManager with _$ReportManager;

abstract class _ReportManager with Store {
  final ReportService _service = ReportService();

  @observable
  Future<List<ReportModel>> reports = Future.value([]);

  @action
  Future<dynamic> fetchReports() async {
    reports =  _service.getAllReports();
  }

  @action
  Future<dynamic> saveNewReport(String name, String description) async{
    ReportModel model = ReportModel(
      name: name,
      description: description
    );

    model.updateDate();

    await _service.addReport(model);
    await _service.getAllReports();
  }


}
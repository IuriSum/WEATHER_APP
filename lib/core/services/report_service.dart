import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_forecast/core/models/report_model.dart';

class ReportService {
  final String  _boxName = "reportBox";

  Future<Box<ReportModel>> get _box async =>
      await Hive.openBox<ReportModel>(_boxName);

  //create
  Future<void> addReport(ReportModel reportModel) async {
    var box = await _box;
    await box.add(reportModel);
  }

  //read
  Future<List<ReportModel>> getAllReports() async {
    var box = await _box;
    return box.values.toList();
  }

  //update
  Future<void> updateDeck(int index, ReportModel report) async { 
    var box = await _box;
    await box.putAt(index, report);
  }

  //delete
  Future<void> deleteReport(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }
}
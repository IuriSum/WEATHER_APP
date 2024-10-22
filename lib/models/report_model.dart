
import 'package:hive/hive.dart';

part 'report_model.g.dart';

@HiveType(typeId: 1) //typeId should be unique for each model
class ReportModel {
  @HiveField(0) //unique Id
  String name;

  @HiveField(1)
  late DateTime? date = _date;

  @HiveField(2)
  String description;

  // inside value
  DateTime? _date;

  void updateDate(){
    _date = DateTime.now();
  }

  ReportModel({required this.name, required this.description});
}
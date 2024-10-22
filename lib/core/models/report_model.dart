
import 'package:hive/hive.dart';

part 'report_model.g.dart';

@HiveType(typeId: 1) //typeId should be unique for each model
class ReportModel {
  @HiveField(0) //unique Id
  late String name;

  @HiveField(1)
  late DateTime date;

  @HiveField(2)
  late String report;
}
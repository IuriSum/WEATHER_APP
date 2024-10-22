// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReportManager on _ReportManager, Store {
  late final _$reportsAtom =
      Atom(name: '_ReportManager.reports', context: context);

  @override
  Future<List<ReportModel>> get reports {
    _$reportsAtom.reportRead();
    return super.reports;
  }

  @override
  set reports(Future<List<ReportModel>> value) {
    _$reportsAtom.reportWrite(value, super.reports, () {
      super.reports = value;
    });
  }

  late final _$fetchReportsAsyncAction =
      AsyncAction('_ReportManager.fetchReports', context: context);

  @override
  Future<dynamic> fetchReports() {
    return _$fetchReportsAsyncAction.run(() => super.fetchReports());
  }

  late final _$saveNewReportAsyncAction =
      AsyncAction('_ReportManager.saveNewReport', context: context);

  @override
  Future<dynamic> saveNewReport(String name, String description) {
    return _$saveNewReportAsyncAction
        .run(() => super.saveNewReport(name, description));
  }

  @override
  String toString() {
    return '''
reports: ${reports}
    ''';
  }
}

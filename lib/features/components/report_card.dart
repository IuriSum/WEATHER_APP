import 'package:flutter/material.dart';
import 'package:weather_forecast/models/report_model.dart';

class _ReportCardState extends State<ReportCard> {
  bool pressed = false;

  String dateFormater(){
    String format = "";
    if(widget.reportModel.date != null){
      DateTime date = widget.reportModel.date!;
      format = "${date.day}/${date.month} - ${date.hour}:${date.minute}";
    }
    return format;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        pressed = !pressed;
      }),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(171, 44, 41, 41),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 1)
                  ),
                  child: Text(
                    widget.reportModel.name,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(171, 44, 41, 41),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 1)
                  ),
                  child: Text(
                    dateFormater(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: widget.deleteCallback,
                  child: Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            AnimatedSize(
              duration: Duration(milliseconds: 200),
              child: pressed?
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.reportModel.description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      height: 0
                    ),
                  ),
                )
              :
                Container()
            )
          ],
        ),
      ),
    );
  }
}

class ReportCard extends StatefulWidget {

  final VoidCallback? deleteCallback;
  final ReportModel reportModel;

  const ReportCard({
    super.key,
    required this.reportModel,
    this.deleteCallback
  });

  @override
  State<ReportCard> createState() => _ReportCardState();
}
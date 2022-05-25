// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, camel_case_types, unused_element, prefer_equal_for_default_values, use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:twitter_app/API/userdata.dart';

class GraphBar extends StatefulWidget {
  final String token;
  GraphBar({Key key, @required this.token}) : super(key: key);
  @override
  _GraphBar createState() => _GraphBar();
}

class _GraphBar extends State<GraphBar> {
  static const String BaseURL = "http://twi-jay.me:8080";

  Future<List> returnedDataGraphBarFuture;
  var returnedDataGraphBar = [];
  List<charts.Series<TaskBar, String>> _seriesPieData;

  Future<int> datafuture;

  Future<List> satsticGraphBarIntegeration(token) async {
    //final allDataReturned = [];

    final allDataBarChartReturned = [];
    int age1 = 0;
    String text1 = '';
    /* int age2 = 0;
    String text2 = ''; */
    var response = await http.get(
      Uri.parse(
        '$BaseURL/admin/dashBoard',
      ),
      headers: {'x-access-token': token},
    );
    setState(() {
      Map pieResponse0 = json.decode(response.body)[3];
      var pieResponse = pieResponse0['users_Per_Month'];
      text1 = pieResponse['_id'];
      age1 = pieResponse['count'];
      /* age2 = pieResponse[1]['persons'];
      text2 = pieResponse[1]['age']; */
      allDataBarChartReturned.addAll([
        text1,
        age1,
        /* text2,
        age2, */
      ]);
    });
    return allDataBarChartReturned;
  }

  @override
  void initState() {
    super.initState();
    _seriesPieData = <charts.Series<TaskBar, String>>[];
    returnedDataGraphBarFuture = satsticGraphBarIntegeration(userdata.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: returnedDataGraphBarFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            returnedDataGraphBarFuture = snapshot.data as Future<List>;
            _generateData(returnedDataGraphBar[0], returnedDataGraphBar[1]);
            return charts.BarChart(
              _seriesPieData,
              animate: true,
              animationDuration: const Duration(seconds: 3),
              domainAxis: const charts.OrdinalAxisSpec(
                renderSpec: charts.SmallTickRendererSpec(labelRotation: 45),
              ),
              behaviors: [
                charts.DatumLegend(
                  outsideJustification: charts.OutsideJustification.endDrawArea,
                  horizontalFirst: false,
                  desiredMaxRows: 2,
                  cellPadding: const EdgeInsets.only(right: 4.0, bottom: 4.0),
                  entryTextStyle: charts.TextStyleSpec(
                    color: charts.MaterialPalette.purple.shadeDefault,
                    fontFamily: 'Georgia',
                    fontSize: 12,
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  _generateData(month1, users1) {
    var pieData = [
      TaskBar(month1, users1, Colors.purple),
      /* TaskBar(user2, count2, Colors.green),
      TaskBar(user3, count3, Colors.blue),
      TaskBar(user4, count4, Colors.red),
      TaskBar(user5, count5, Colors.red), */
    ];
    _seriesPieData.add(
      charts.Series(
        data: pieData,
        domainFn: (TaskBar task, _) => task.task,
        measureFn: (TaskBar task, _) => task.taskvalue,
        colorFn: (TaskBar task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Most Followed Users',
        labelAccessorFn: (TaskBar row, _) => '${row.taskvalue}',
      ),
    );
  }
}

class TaskBar {
  var task;
  var taskvalue;
  var testt;
  Color colorval;
  TaskBar(this.task, this.taskvalue, this.colorval);
}

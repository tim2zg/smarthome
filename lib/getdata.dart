import 'package:charts_flutter/flutter.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:influxdb_client/api.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

Future<charts.Series<dynamic, DateTime>> getthedata() async {
  var thedata = [];

  InfluxDBClient client = InfluxDBClient(
      url: 'http://10.0.6.7:8086',
      username: 'admin',
      password: 'tim',
      debug: false);

  var queryService = client.getQueryService();

  var wtf = await queryService.query('''from(bucket: "iobroker")
  |> range(start: -4d)
  |> filter(fn: (r) => r["_measurement"] == "fronius.0.powerflow.P_PV")
  |> filter(fn: (r) => r["_field"] == "value")
  |> aggregateWindow(every: 1m, fn: mean, createEmpty: false)
  |> yield(name: "mean")''');

  await wtf.forEach((element) {
      thedata.add(data(DateTime.parse(element['_time']), element['_value']));});

  client.close();

  return
    charts.Series<dynamic, DateTime>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (data, _) => data.time,
      measureFn: (data, _) => data.value,
      data: thedata,
    )
  ;
}

Future<charts.Series<dynamic, DateTime>> getthedatagrid() async {
  var thedata = [];

  InfluxDBClient client = InfluxDBClient(
      url: 'http://10.0.6.7:8086',
      username: 'admin',
      password: 'tim',
      debug: false);

  var queryService = client.getQueryService();

  var wtf = await queryService.query('''from(bucket: "iobroker")
  |> range(start: -4d)
  |> filter(fn: (r) => r["_measurement"] == "fronius.0.powerflow.P_Grid")
  |> filter(fn: (r) => r["_field"] == "value")
  |> aggregateWindow(every: 1m, fn: mean, createEmpty: false)
  |> yield(name: "mean")''');

  await wtf.forEach((element) {
    thedata.add(data(DateTime.parse(element['_time']), element['_value']));});

  client.close();

  return
    charts.Series<dynamic, DateTime>(
      displayName: "Grid",
      id: 'Grid',
      colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      domainFn: (data, _) => data.time,
      measureFn: (data, _) => data.value,
      data: thedata,
    )
  ;
}

Future<List<Series<dynamic, DateTime>>> getalldata() async {
  var graph1 = await getthedata();
  var graph2 = await getthedatagrid();
  return [
     graph1,
     graph2,
  ];
}

class data {
  final DateTime time;
  final double value;

  data(this.time, this.value);
}

class getdata extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Button(onPressed: () => {getthedata()}, child: Text("What have you done"),),),);
}}
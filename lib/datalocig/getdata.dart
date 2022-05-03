// ignore_for_file: avoid_types_as_parameter_names

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

// ignore: camel_case_types
class data {
  final DateTime time;
  final double value;

  data(this.time, this.value);
}

Future<List<charts.Series<dynamic, DateTime>>> betteriday(String duration, String frequenz) async {
  var thedata = [];
  var thedata2 = [];

  InfluxDBClient client = InfluxDBClient(
      url: 'http://10.0.6.7:8086',
      username: 'admin',
      password: 'tim',
      debug: false);

  var queryService = client.getQueryService();

  var wtf = await queryService.query('''from(bucket: "iobroker")
  |> range(start: -${duration})
  |> filter(fn: (r) => r["_measurement"] == "fronius.0.powerflow.P_Akku")
  |> filter(fn: (r) => r["_field"] == "value")
  |> aggregateWindow(every: ${frequenz}, fn: mean, createEmpty: false)
  |> yield(name: "mean")''');

  await wtf.forEach((element) {
    thedata.add(data(DateTime.parse(element['_time']), element['_value']));});

  var wtf2 = await queryService.query('''from(bucket: "iobroker")
  |> range(start: -${duration})
  |> filter(fn: (r) => r["_measurement"] == "fronius.0.powerflow.inverter1.SOC")
  |> filter(fn: (r) => r["_field"] == "value")
  |> aggregateWindow(every: ${frequenz}, fn: mean, createEmpty: false)
  |> yield(name: "mean")''');

  await wtf2.forEach((element) {
    thedata2.add(data(DateTime.parse(element['_time']), element['_value']));});

  client.close();

  return
    [charts.Series<dynamic, DateTime>(
      id: 'Bateri W',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (data, _) => data.time,
      measureFn: (data, _) => data.value,
      data: thedata,
    ),
      charts.Series<dynamic, DateTime>(
        id: 'Bateri %',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (data, _) => data.time,
        measureFn: (data, _) => data.value,
        data: thedata2,
      ),
    ]
  ;
}

Future<List<charts.Series<dynamic, DateTime>>> griddataget(String duration, String frequenz) async {
  var thedata = [];


  InfluxDBClient client = InfluxDBClient(
      url: 'http://10.0.6.7:8086',
      username: 'admin',
      password: 'tim',
      debug: false);

  var queryService = client.getQueryService();

  var wtf = await queryService.query('''from(bucket: "iobroker")
  |> range(start: -${duration})
  |> filter(fn: (r) => r["_measurement"] == "fronius.0.powerflow.P_Grid")
  |> filter(fn: (r) => r["_field"] == "value")
  |> aggregateWindow(every: ${frequenz}, fn: mean, createEmpty: false)
  |> yield(name: "mean")''');

  await wtf.forEach((element) {
    thedata.add(data(DateTime.parse(element['_time']), element['_value']));});

  client.close();

  return
    [charts.Series<dynamic, DateTime>(
      id: 'Grid W',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (data, _) => data.time,
      measureFn: (data, _) => data.value,
      data: thedata,
    ),
    ];
}

Future<List<charts.Series<dynamic, DateTime>>> eigenverbrauchget(String duration, String frequenz) async {
  var thedata = [];


  InfluxDBClient client = InfluxDBClient(
      url: 'http://10.0.6.7:8086',
      username: 'admin',
      password: 'tim',
      debug: false);

  var queryService = client.getQueryService();

  var wtf = await queryService.query('''from(bucket: "iobroker")
  |> range(start: -${duration})
  |> filter(fn: (r) => r["_measurement"] == "0_userdata.0.SolarDaten.Eigenverbrauch")
  |> filter(fn: (r) => r["_field"] == "value")
  |> aggregateWindow(every: ${frequenz}, fn: mean, createEmpty: false)
  |> yield(name: "mean")''');

  await wtf.forEach((element) {
    thedata.add(data(DateTime.parse(element['_time']), element['_value']));});

  client.close();

  return
    [charts.Series<dynamic, DateTime>(
      id: 'Verbrauch W',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (data, _) => data.time,
      measureFn: (data, _) => data.value,
      data: thedata,
    ),
    ];
}

Future<List<charts.Series<dynamic, DateTime>>> solar1dataget(String duration, String frequenz) async {
  var thedata = [];


  InfluxDBClient client = InfluxDBClient(
      url: 'http://10.0.6.7:8086',
      username: 'admin',
      password: 'tim',
      debug: false);

  var queryService = client.getQueryService();

  var wtf = await queryService.query('''from(bucket: "iobroker")
  |> range(start: -${duration})
  |> filter(fn: (r) => r["_measurement"] == "fronius.0.powerflow.P_PV")
  |> filter(fn: (r) => r["_field"] == "value")
  |> aggregateWindow(every: ${frequenz}, fn: mean, createEmpty: false)
  |> yield(name: "mean")''');

  await wtf.forEach((element) {
    thedata.add(data(DateTime.parse(element['_time']), element['_value']));});

  client.close();

  return
    [charts.Series<dynamic, DateTime>(
      id: 'Solar1 W',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (data, _) => data.time,
      measureFn: (data, _) => data.value,
      data: thedata,
    ),
    ];
}

Future<List<charts.Series<dynamic, DateTime>>> solar2dataget(String duration, String frequenz) async {
  var thedata = [];


  InfluxDBClient client = InfluxDBClient(
      url: 'http://10.0.6.7:8086',
      username: 'admin',
      password: 'tim',
      debug: false);

  var queryService = client.getQueryService();

  var wtf = await queryService.query('''from(bucket: "iobroker")
  |> range(start: -${duration})
  |> filter(fn: (r) => r["_measurement"] == "fronius.1.powerflow.P_PV")
  |> filter(fn: (r) => r["_field"] == "value")
  |> aggregateWindow(every: ${frequenz}, fn: mean, createEmpty: false)
  |> yield(name: "mean")''');

  await wtf.forEach((element) {
    thedata.add(data(DateTime.parse(element['_time']), element['_value']));});

  client.close();

  return
    [charts.Series<dynamic, DateTime>(
      id: 'Solar1 W',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (data, _) => data.time,
      measureFn: (data, _) => data.value,
      data: thedata,
    ),
    ];
}

Future<List<charts.Series<dynamic, DateTime>>> solarcomdataget(String duration, String frequenz) async {
  var thedata = [];


  InfluxDBClient client = InfluxDBClient(
      url: 'http://10.0.6.7:8086',
      username: 'admin',
      password: 'tim',
      debug: false);

  var queryService = client.getQueryService();

  var wtf = await queryService.query('''from(bucket: "iobroker")
  |> range(start: -${duration})
  |> filter(fn: (r) => r["_measurement"] == "0_userdata.0.SolarDaten.SolarLeistungzusammen")
  |> filter(fn: (r) => r["_field"] == "value")
  |> aggregateWindow(every: ${frequenz}, fn: mean, createEmpty: false)
  |> yield(name: "mean")''');

  await wtf.forEach((element) {
    thedata.add(data(DateTime.parse(element['_time']), element['_value']));});

  client.close();

  return
    [charts.Series<dynamic, DateTime>(
      id: 'Solarcom W',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (data, _) => data.time,
      measureFn: (data, _) => data.value,
      data: thedata,
    ),
    ];
}

Future<List<charts.Series<dynamic, DateTime>>> autdatagetig(String duration, String frequenz) async {
  var thedata = [];


  InfluxDBClient client = InfluxDBClient(
      url: 'http://10.0.6.7:8086',
      username: 'admin',
      password: 'tim',
      debug: false);

  var queryService = client.getQueryService();

  var wtf = await queryService.query('''from(bucket: "iobroker")
  |> range(start: -${duration})
  |> filter(fn: (r) => r["_measurement"] == "fronius.0.powerflow.rel_Autonomy")
  |> filter(fn: (r) => r["_field"] == "value")
  |> aggregateWindow(every: ${frequenz}, fn: mean, createEmpty: false)
  |> yield(name: "mean")''');

  await wtf.forEach((element) {
    thedata.add(data(DateTime.parse(element['_time']), element['_value']));});

  client.close();

  return
    [charts.Series<dynamic, DateTime>(
      id: 'Autark %',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (data, _) => data.time,
      measureFn: (data, _) => data.value,
      data: thedata,
    ),
    ];
}

Future<List<charts.Series<dynamic, DateTime>>> eigverbdatagetig(String duration, String frequenz) async {
  var thedata = [];


  InfluxDBClient client = InfluxDBClient(
      url: 'http://10.0.6.7:8086',
      username: 'admin',
      password: 'tim',
      debug: false);

  var queryService = client.getQueryService();

  var wtf = await queryService.query('''from(bucket: "iobroker")
  |> range(start: -${duration})
  |> filter(fn: (r) => r["_measurement"] == "0_userdata.0.SolarDaten.Eigenverbrauch_%")
  |> filter(fn: (r) => r["_field"] == "value")
  |> aggregateWindow(every: ${frequenz}, fn: mean, createEmpty: false)
  |> yield(name: "mean")''');

  await wtf.forEach((element) {
    thedata.add(data(DateTime.parse(element['_time']), element['_value']));});

  client.close();

  return
    [charts.Series<dynamic, DateTime>(
      id: 'Eigenverbauch %',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (data, _) => data.time,
      measureFn: (data, _) => data.value,
      data: thedata,
    ),
    ];
}
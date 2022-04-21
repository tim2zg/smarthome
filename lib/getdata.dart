import 'package:influxdb_client/api.dart';
import 'package:flutter/material.dart';

void getthedata() async {
  var client = InfluxDBClient(
    url: 'http://10.0.6.7:8086',
    password: '',
    username: '',
    bucket: ''
  );

  var queryService = client.getQueryService();

  var recordStream = await queryService.query('''
  from(bucket: "my-bucket")
  |> range(start: 0)
  |> filter(fn: (r) => r["_measurement"] == "cpu")
  |> filter(fn: (r) => r["cpu"] == "cpu-total")
  |> aggregateWindow(every: 1m, fn: mean, createEmpty: false)
  |> yield(name: "mean")
  ''');

  var count = 0;
  await recordStream.forEach((record) {
    print(
        'record: ${count++} ${record['_time']}: ${record['host']} ${record['cpu']} ${record['_value']}');
  });

  client.close();
}


class getdata extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("adsf"),
    );
  }
}
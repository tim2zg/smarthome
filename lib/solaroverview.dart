import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class solardataview extends StatefulWidget {
  @override
  solardata createState() {
    return new solardata();
  }
}

class solardata extends State<solardataview> {
  String batteridata = "";
  String sundata = "";
  String verbrauchdata = "";
  String griddata = "";
  String solardata1 = "";
  String solardata2 = "";
  String eigenverbrauchdata = "";
  String autarkdata = "";

  Color eigenverbrauchcolor = Colors.grey;
  Color autaurkcolor = Colors.grey;


  myCallback() async {
    batteri().then((val) => setState(() {
      batteridata = val;
    }));
    sun().then((val) => setState(() {
    sundata = val;
    }));
    verbrauch().then((val) => setState(() {
    verbrauchdata = val;
    }));
    Grid().then((val) => setState(() {
    griddata = val;
    }));
    solar1().then((val) => setState(() {
    solardata1 = val;
    }));
    solar2().then((val) => setState(() {
    solardata2 = val;
    }));
    eigenverbrauch().then((val) => setState(() {
    eigenverbrauchdata = val.toString() + "%";
    if (val < 100) {
      eigenverbrauchcolor = Colors.green;
    } else {
      eigenverbrauchcolor = Colors.redAccent;
    }}));
    autonom().then((val) => setState(() {
      autarkdata = val.toString() + "%";
      if (val > 90) {
        autaurkcolor = Colors.green;
      } else if (val > 60) {
        autaurkcolor = Colors.lightGreenAccent;
      } else {
        autaurkcolor = Colors.redAccent;
      }
    }));
  }

  solardata () {
    myCallback();
    Timer.periodic(const Duration(seconds: 10), (Timer t) => {
        myCallback()
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tim",
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blueGrey
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tim'),
          titleTextStyle: TextStyle(color: Colors.orange, fontSize: 20, fontStyle: FontStyle.italic),
          leading: GestureDetector(
            child: Icon( Icons.arrow_back_ios, color: Colors.black,  ),
            onTap: () {
              Navigator.pop(context);
            } ,
          ) ,
        ),

        body: Column(mainAxisAlignment: MainAxisAlignment.center ,children: [Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Column(
                    children: [
                      Icon(Icons.battery_full),
                      Text(batteridata)
                    ],
                  )
              ),
              SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Column(
                    children: [
                      Icon(Icons.power),
                      Text(griddata)
                    ],
                  )
              ),
              SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Column(
                    children: [
                      Icon(Icons.lightbulb),
                      Text(verbrauchdata)
                    ],
                  )
              ),
        ],),
      ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: Column(
                      children: [
                        Icon(Icons.wb_sunny),
                        Text(solardata1)
                      ],
                    )
                ),
                SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: Column(
                      children: [
                        Icon(Icons.wb_sunny),
                        Text(solardata2)
                      ],
                    )
                ),
                SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: Column(
                        children: [
                          Icon(Icons.wb_sunny),
                          Text(sundata)
                        ]
                    )
                ),
              ],),

          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: ButtonTheme(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        splashColor: Colors.black,
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.speed, size: 18),
                          label: Text(autarkdata, style: const TextStyle(color: Colors.black)),
                          onPressed: () {},
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(autaurkcolor),
                            foregroundColor: MaterialStateProperty.all(Colors.black),
                            overlayColor: MaterialStateProperty.all(Colors.grey),
                            shadowColor: MaterialStateProperty.all(Colors.black),
                          ),
                        )
                    )
                ),
                SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: ButtonTheme(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        splashColor: Colors.black,
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.speed, size: 18),
                          label: Text(eigenverbrauchdata, style: const TextStyle(color: Colors.black)),
                          onPressed: () {},
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(eigenverbrauchcolor),
                            foregroundColor: MaterialStateProperty.all(Colors.black),
                            overlayColor: MaterialStateProperty.all(Colors.grey),
                            shadowColor: MaterialStateProperty.all(Colors.black),
                          ),
                        )
                    )
                )
              ],),
          )
    ])));
  }

  Future<String> batteri() async {
    var response = await http.get(
        Uri.parse("http://10.0.1.121:8087/getPlainValue/fronius.0.powerflow.P_Akku")
    );
    var response2 = await http.get(
        Uri.parse("http://10.0.1.121:8087/getPlainValue/fronius.0.powerflow.inverter1.SOC")
    );
    return "${double.parse(response.body).round()}W  ${double.parse(response2.body).round()}%";
  }

  Future<String> sun() async {
    var response = await http.get(
        Uri.parse("http://10.0.1.121:8087/getPlainValue/0_userdata.0.SolarDaten.SolarLeistungzusammen")
    );
    return "${double.parse(response.body).round()}W";
  }

  Future<String> verbrauch() async {
    var response = await http.get(
        Uri.parse("http://10.0.1.121:8087/getPlainValue/0_userdata.0.SolarDaten.Eigenverbrauch")
    );
    return "${double.parse(response.body).round()}W";
  }

  Future<String> Grid() async {
    var response = await http.get(
        Uri.parse("http://10.0.1.121:8087/getPlainValue/fronius.0.powerflow.P_Grid")
    );
    return "${double.parse(response.body).round()}W";
  }

  Future<String> solar1() async {
    var response = await http.get(
        Uri.parse("http://10.0.1.121:8087/getPlainValue/fronius.0.powerflow.P_PV")
    );
    return "${double.parse(response.body).round()}W";
  }

  Future<String> solar2() async {
    var response = await http.get(
        Uri.parse("http://10.0.1.121:8087/getPlainValue/fronius.1.powerflow.P_PV")
    );
    return "${double.parse(response.body).round()}W";
  }

  Future<int> autonom() async {
    var response = await http.get(
        Uri.parse("http://10.0.1.121:8087/getPlainValue/fronius.0.powerflow.rel_Autonomy")
    );
    return double.parse(response.body).round();
  }

  Future<int> eigenverbrauch() async {
    var response = await http.get(
        Uri.parse("http://10.0.1.121:8087/getPlainValue/0_userdata.0.SolarDaten.Eigenverbrauch_%")
    );
    return double.parse(response.body).round();
  }

}




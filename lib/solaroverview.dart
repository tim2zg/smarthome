import 'dart:async';
import 'package:flutter/material.dart';
import 'chartsandstuff/batteri.dart';
import 'chartsandstuff/grid.dart';
import 'chartsandstuff/solar1.dart';
import 'chartsandstuff/solar2.dart';
import 'chartsandstuff/verbrauch.dart';
import 'chartsandstuff/solarcombine.dart';
import 'chartsandstuff/autark.dart';
import 'chartsandstuff/eigverb.dart';
import 'package:http/http.dart' as http;

class solardataview extends StatefulWidget {
  const solardataview({Key? key}) : super(key: key);

  @override
  solardata createState() {
    return solardata();
  }
}

class solardata extends State<solardataview> {
  late Timer timmmer;

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
  Color batteriecolor = Colors.grey;
  Color girdcolor = Colors.grey;
  Color eigverbcolor = Colors.grey;
  Color solar1color = Colors.grey;
  Color solar2color = Colors.grey;
  Color solarcomcolor = Colors.grey;

  myCallback() async {
    batteri1().then((val) => setState(() {
      batteridata = val.toString() + "W  ";
    }));
    batteri2().then((val) => setState(() {
      batteridata = batteridata + val.toString() + "%";
      if (val > 90) {
        batteriecolor = Colors.green;
      } else if (val > 40) {
        batteriecolor = Colors.yellow;
      } else {
        batteriecolor = Colors.redAccent;
      }
    }));
    sun().then((val) => setState(() {
      sundata = val.toString() + "W";
      if (val > 6000) {
        solarcomcolor = Colors.green;
      } else if (val > 1200) {
        solarcomcolor = Colors.yellow;
      } else {
        solarcomcolor = Colors.red;
      }
    }));
    verbrauch().then((val) => setState(() {
    verbrauchdata = val.toString() + "W";
    if (val < 600) {
      eigverbcolor = Colors.green;
    } else if (val < 1200) {
      eigverbcolor = Colors.yellow;
    } else {
      eigverbcolor = Colors.red;
    }
    }));
    Grid().then((val) => setState(() {
    griddata = val.toString() + "W";
    if (val < -30) {
      girdcolor = Colors.green;
    } else if (val > 30) {
      girdcolor = Colors.red;
    } else {
      girdcolor = Colors.yellow;
    }
    }));
    solar1().then((val) => setState(() {
    solardata1 = val.toString() + "W";
    if (val > 3000) {
      solar1color = Colors.green;
    } else if (val > 600) {
      solar1color = Colors.yellow;
    } else {
      solar1color = Colors.red;
    }
    }));
    solar2().then((val) => setState(() {
      solardata2 = val.toString() + "W";
      if (val > 3000) {
        solar2color = Colors.green;
      } else if (val > 600) {
        solar2color = Colors.yellow;
      } else {
        solar2color = Colors.red;
      }
    }));
    eigenverbrauch().then((val) => setState(() {
    eigenverbrauchdata = val.toString() + "%";
    if (val < 100) {
      eigenverbrauchcolor = Colors.green;
    } else {
      eigenverbrauchcolor = Colors.red;
    }}));
    autonom().then((val) => setState(() {
      autarkdata = val.toString() + "%";
      if (val > 90) {
        autaurkcolor = Colors.green;
      } else if (val > 60) {
        autaurkcolor = Colors.yellow;
      } else {
        autaurkcolor = Colors.red;
      }
    }));
  }


  solardata () {
    myCallback();
    timmmer = Timer.periodic(const Duration(seconds: 10), (Timer t) => {
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
          title: const Text('Solar'),
          titleTextStyle: const TextStyle(color: Colors.orange, fontSize: 20, fontStyle: FontStyle.italic),
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios, color: Colors.black,  ),
            onTap: () {
              Navigator.pop(context);
              timmmer.cancel();
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
                  child: ButtonTheme(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      splashColor: Colors.black,
                      child: OutlinedButton.icon(
                        icon: const Icon(Icons.battery_full, size: 18),
                        label: Text(batteridata, style: const TextStyle(color: Colors.black)),
                        onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => batterieuff()),
                        );},
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(batteriecolor),
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
                        icon: const Icon(Icons.power, size: 18),
                        label: Text(griddata, style: const TextStyle(color: Colors.black)),
                        onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => griduffchart()),
                        );},
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(girdcolor),
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
                        icon: const Icon(Icons.lightbulb, size: 18),
                        label: Text(verbrauchdata, style: const TextStyle(color: Colors.black)),
                        onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => verbruahcdata()),
                        );},
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(eigverbcolor),
                          foregroundColor: MaterialStateProperty.all(Colors.black),
                          overlayColor: MaterialStateProperty.all(Colors.grey),
                          shadowColor: MaterialStateProperty.all(Colors.black),
                        ),
                      )
                  )
              ),
        ],),
      ),
          const SizedBox(height: 30,),
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
                          icon: const Icon(Icons.wb_sunny, size: 18),
                          label: Text(solardata1, style: const TextStyle(color: Colors.black)),
                          onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => solar1data()),
                          );},
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(solar1color),
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
                          icon: const Icon(Icons.wb_sunny, size: 18),
                          label: Text(solardata2, style: const TextStyle(color: Colors.black)),
                          onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => solar2data()),
                          );},
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(solar2color),
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
                          icon: const Icon(Icons.wb_sunny, size: 18),
                          label: Text(sundata, style: const TextStyle(color: Colors.black)),
                          onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => solarcomdata()),
                          );},
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(solarcomcolor),
                            foregroundColor: MaterialStateProperty.all(Colors.black),
                            overlayColor: MaterialStateProperty.all(Colors.grey),
                            shadowColor: MaterialStateProperty.all(Colors.black),
                          ),
                        )
                    )
                ),
              ],),

          ),
          const SizedBox(height: 30),
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
                          onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => autdatadisplay()),
                          );},
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
                          onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => eigverbdata()),
                          );},
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

  Future<int> batteri1() async {
    var response = await http.get(
        Uri.parse("http://10.0.1.121:8087/getPlainValue/fronius.0.powerflow.P_Akku")
    );
    return double.parse(response.body).round();
  }

  Future<int> batteri2() async {
    var response2 = await http.get(
        Uri.parse("http://10.0.1.121:8087/getPlainValue/fronius.0.powerflow.inverter1.SOC")
    );
    return double.parse(response2.body).round();
  }

  Future<int> sun() async {
    var response = await http.get(
        Uri.parse("http://10.0.1.121:8087/getPlainValue/0_userdata.0.SolarDaten.SolarLeistungzusammen")
    );
    return double.parse(response.body).round();
  }

  Future<int> verbrauch() async {
    var response = await http.get(
        Uri.parse("http://10.0.1.121:8087/getPlainValue/0_userdata.0.SolarDaten.Eigenverbrauch")
    );
    return double.parse(response.body).round();
  }

  Future<int> Grid() async {
    var response = await http.get(
        Uri.parse("http://10.0.1.121:8087/getPlainValue/fronius.0.powerflow.P_Grid")
    );
    return double.parse(response.body).round();
  }

  Future<int> solar1() async {
    var response = await http.get(
        Uri.parse("http://10.0.1.121:8087/getPlainValue/fronius.0.powerflow.P_PV")
    );
    return double.parse(response.body).round();
  }

  Future<int> solar2() async {
    var response = await http.get(
        Uri.parse("http://10.0.1.121:8087/getPlainValue/fronius.1.powerflow.P_PV")
    );
    return double.parse(response.body).round();
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




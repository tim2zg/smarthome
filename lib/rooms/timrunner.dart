import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<String> rauf() async {
  var response = await http.get(
      Uri.parse("http://10.0.1.121:8087/set/hm-rega.0.4156.ProgramExecute?value=True"),
      headers: {
        "Accept": "application/json"
      }
  );
  print(json.decode(response.body));

  return "Success!";
}

Future<String> runter() async {
  var response = await http.get(
      Uri.parse("http://10.0.1.121:8087/set/hm-rega.0.4168.ProgramExecute?value=True"),
      headers: {
        "Accept": "application/json"
      }
  );
  print(json.decode(response.body));

  return "Success!";
}

Future<String> stop() async {
  var response = await http.get(
      Uri.parse("http://10.0.1.121:8087/set/hm-rega.0.4180.ProgramExecute?value=True"),
      headers: {
        "Accept": "application/json"
      }
  );
  print(json.decode(response.body));

  return "Success!";
}

Future<String> Lichtein() async {
  var response = await http.get(
      Uri.parse("http://10.0.1.121:8087/set/scriptEnabled.Skripte.Licht_on_real?value=True"),
      headers: {
        "Accept": "application/json"
      }
  );
  print(json.decode(response.body));

  return "Success!";
}

Future<String> Lichtaus() async {
  var response = await http.get(
      Uri.parse("http://10.0.1.121:8087/set/scriptEnabled.Skripte.Licht_on?value=True"),
      headers: {
        "Accept": "application/json"
      }
  );
  print(json.decode(response.body));

  return "Success!";
}

Future<String> Uhrein() async {
  var response = await http.get(
      Uri.parse("http://10.0.1.121:8087/set/scriptEnabled.Skripte.Uhr_ein?value=True"),
      headers: {
        "Accept": "application/json"
      }
  );
  print(json.decode(response.body));

  return "Success!";
}

Future<String> party() async {
  var response = await http.get(
      Uri.parse("http://10.0.1.121:8087/set/wled.0.483fda499ffa.seg.0.fx?value=9"),
      headers: {
        "Accept": "application/json"
      }
  );
  print(json.decode(response.body));

  return "Success!";
}

Future<String> still() async {
  var response = await http.get(
      Uri.parse("http://10.0.1.121:8087/set/wled.0.483fda499ffa.seg.0.fx?value=0"),
      headers: {
        "Accept": "application/json"
      }
  );
  print(json.decode(response.body));

  return "Success!";
}

Future<String> wipe() async {
  var response = await http.get(
      Uri.parse("http://10.0.1.121:8087/set/wled.0.483fda499ffa.seg.0.fx?value=36"),
      headers: {
        "Accept": "application/json"
      }
  );
  print(json.decode(response.body));

  return "Success!";
}

Future<String> running() async {
  var response = await http.get(
      Uri.parse("http://10.0.1.121:8087/set/wled.0.483fda499ffa.seg.0.fx?value=15"),
      headers: {
        "Accept": "application/json"
      }
  );
  print(json.decode(response.body));

  return "Success!";
}
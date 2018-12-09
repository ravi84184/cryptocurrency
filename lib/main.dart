import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home_page.dart';

void main() async {
  List currency = await getCurrencies();
  runApp(MyApp(currency));
}

class MyApp extends StatelessWidget {
  final List currency;

  MyApp(this.currency);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(currency),
      debugShowCheckedModeBanner: false,
    );
  }
}

Future<List> getCurrencies() async {
  String url = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

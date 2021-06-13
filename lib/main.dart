import 'package:flutter/material.dart';
import 'package:flutter_http_demo/views/home_screen.dart';
import 'package:flutter_http_demo/views/main_screen.dart';

void main() {
  runApp(MyHttpApp());
}

class MyHttpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MainScreen(),
      debugShowCheckedModeBanner: false, // debug yazısını kaldırmaya yarar.
    );
  }
}

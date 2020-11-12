import 'package:flutter/material.dart';
import 'package:wordtime_app/pages/homeScreen.dart';
import 'package:wordtime_app/pages/loadingScreen.dart';
import 'package:wordtime_app/pages/locationscreen.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', routes: {
    '/': (context) => LoadingScreen(),
    '/home': (context) => HomeScreen(),
    '/location': (context) => LocationScreen(),
  }));
}

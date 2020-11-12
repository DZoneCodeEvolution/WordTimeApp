
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wordtime_app/services/wordservices.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  String time = "loading";

  void setupWordtime() async{
    WordTime instance = WordTime(location:'Berlin', flag:'germany.png', url:'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'time' : instance.time,
      'flag' : instance.flag,
      'daytime' : instance.daytime
    });
  }
  void initState() {
    super.initState();
    setupWordtime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.blue,
        body:Center(
         child: SpinKitFadingCube(
           color:Colors.white,
           size: 50.0,
         ),
       )
    );
  }
}

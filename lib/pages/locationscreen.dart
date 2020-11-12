import 'package:flutter/material.dart';
import 'package:wordtime_app/services/wordservices.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<WordTime> location = [
    WordTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WordTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'dubai.png'),
    WordTime(url: 'Europe/Berlin', location: 'Athems', flag: 'uk.png'),
    WordTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WordTime(
        url: 'America/New_York', location: 'New York', flag: 'america.png'),
  ];

  void updateTime(index) async {
    WordTime instance = location[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'daytime': instance.daytime
    });
  }

  @override
  void initState() {
    super.initState();
    print("initstate method run :1");
  }

  @override
  Widget build(BuildContext context) {
    print("initstate method run :2");
    return Scaffold(
        appBar: AppBar(
          title: Text("Location Select"),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: location.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(location[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${location[index].flag}'),
                  ),
                ),
              ),
            );
          },
        ));
  }
}

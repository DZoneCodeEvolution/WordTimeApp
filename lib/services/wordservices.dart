import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WordTime {
  String location;
  String time;
  String flag;
  String url;
  bool daytime;

  WordTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response responce =
          await get('https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(responce.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      print(offset);
      print(datetime);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      daytime =  now.hour > 6 && now.hour < 20 ? true : false;

      time = DateFormat.jm().format(now);

    } catch (e) {
      print(e);
      time = "Not Get Time Data";
    }
  }
}

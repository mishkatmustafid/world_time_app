import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location;  // Location name for the UI
  String time; // The time int hat location
  String flag; // URL to an asset flag icon
  String url; // Location URL for API endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async{
    // make the request
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    //print(data);

    // get properties from data
    String datetime = data['utc_datetime'];           // We can use 'datetime' directly to get local time
    String offset = data['utc_offset'].substring(1,3);// But lets just follow the tutorial for now.
    //print(datetime);
    //print(offset);

    // create Datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(new Duration(hours: int.parse(offset)));

    // set the time property
    time = now.toString();


  }
}


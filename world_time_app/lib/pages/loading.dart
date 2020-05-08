import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async{
    // make the request
    Response response = await get('http://worldtimeapi.org/api/timezone/Asia/Dhaka');
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
    print(now);


  }

  @override
  void initState() {
    super.initState();
    getTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Loading Screen')),
    );
  }
}

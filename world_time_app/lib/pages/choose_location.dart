import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async{
    // simulate network request for a username
    await Future.delayed(Duration(seconds: 3), (){
      print('Yoshi');
    });

    // simulate network request to get bio of the username
    await Future.delayed(Duration(seconds: 2), (){
      print('Chun-li');
    });

    print('Statement');
  }

  int counter = 0;

  @override
  void initState() {
    super.initState();
    getData();
    print('initState');

  }

  @override
  Widget build(BuildContext context) {
    //print('build run');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: RaisedButton(
          onPressed: () {
            setState(() {
              counter+=1;
            });
          },
        child: Text('counter is $counter'),
      ),
    );
  }
}

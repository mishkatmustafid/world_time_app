import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'rsz_uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'rsz_greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'rsz_egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'rsz_kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'rsz_usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'rsz_usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'rsz_south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'rsz_indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime' : instance.isDaytime,
    });

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
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
      ),
    );
  }
}

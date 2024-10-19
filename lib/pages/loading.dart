// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});
  

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getData() async {
    late bool isDayTime;
    Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Cairo'));
    var recivedData = jsonDecode(response.body);
    // String datetime = recivedData['utc_datetime'];
    // DateTime realTime = DateTime.parse(datetime);
    // print(datetime);
    DateTime dateTime=DateTime.parse(recivedData['utc_datetime']);

    // String offset = recivedData['utc_offset'].substring(0, 3);
    // int intoffset=int.parse(offset);
    // print(offset);
    int offset=int.parse(recivedData['utc_offset'].substring(0, 3));
    DateTime realTime=dateTime.add(Duration(hours: offset));
    if (realTime.hour>5 && realTime.hour<18) {
       isDayTime=true;
      
    } else { isDayTime=false;
      
    }
    String timeNow=DateFormat('hh:mm a').format(realTime);
    String timeZone=recivedData['timezone'];
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'time':timeNow,
      'zone':timeZone,
      'isdaytime':isDayTime
    });
    

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Loading',
          style: TextStyle(fontSize: 40),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SpinKitRing(
              color: Colors.grey,
              size: 50,
             ),

          ],
        ),
      ),
    );
  }
}

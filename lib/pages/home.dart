// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> { 

  @override
  Widget build(BuildContext context) {
   Map receivedData = ModalRoute.of(context)!.settings.arguments as Map;
   String png=receivedData['isdaytime']? 'day.png':'night.png';

    return Scaffold(
  
      body: Container(decoration: BoxDecoration(
        color: Colors.black38,
         image: DecorationImage(image: AssetImage("assets/$png"), fit: BoxFit.cover),

      ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.edit_location,
                  color: Color.fromARGB(255, 255, 129, 129),
                  size: 24.0,
                ),
                label: Text(
                  "Edit location",
                  style: TextStyle(fontSize: 19,color: Color.fromARGB(200, 255, 255, 255)),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(120, 90, 103, 223)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(22)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                ),
              ),
              SizedBox(
                height: 300,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 22),
                color: Color.fromARGB(104, 0, 0, 0),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      '${receivedData['time'].toString()}',
                      style: TextStyle(fontSize: 55, color: Colors.white),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      receivedData['zone'],
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

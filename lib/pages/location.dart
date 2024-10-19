import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white70 ,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 104, 104, 104),
      title: Text('Choose Location',style: TextStyle(color: Colors.white),),),
      body: Padding(padding: EdgeInsets.all(3),
        
        child: Card(child: ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage('assets/egypt.png'),),
         title: Text('Egypt-Ciro'),
        ),),
      )
    );
  }
}

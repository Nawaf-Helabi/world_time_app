import 'package:flutter/material.dart';
import 'package:world_time_app/pages/location.dart';

import 'pages/loading.dart';
import 'pages/home.dart';
void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
       initialRoute: '/',
      routes: {
        '/' : (context) => const Loading(),
        '/home' : (context) => const Home(),
        '/location' : (context) => const Location(),
      }
      
      ,
    );
  }
}
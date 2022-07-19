import 'package:flutter/material.dart';
import 'package:shared_data/screens/counter.dart';
import 'package:shared_data/screens/input.dart';
import 'package:shared_data/screens/output.dart';
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context)=> InputScreen(),
        '/output':(context)=> OutPutScreen(),
        '/counter':(context)=> Counter(),
      },
    );
  }
}
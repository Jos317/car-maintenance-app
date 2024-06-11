import 'package:flutter/material.dart';
import 'package:flutter_app/presentacion/pages/login.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cars App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.black),
      home: Scaffold(
        body: Login(),
      ),
    );
  }
}

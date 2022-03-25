import 'package:flutter/material.dart';
import 'package:movie_app_ihits/screens/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App iHits',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const FirstScreen(),
    );
  }
}

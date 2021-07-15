import 'package:flutter/material.dart';
import 'package:flutter_phrase_ota_2021/features/hereos/hero_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heroes of Computer Science',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HeroList(title: 'Heroes of Computer Science'),
    );
  }
}

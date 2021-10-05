import 'package:flutter/material.dart';
import 'package:flutter_test_topics/pages/sum_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Ruddy\'s',
      debugShowCheckedModeBanner: false,
      home: SumPage(),
    );
  }
}

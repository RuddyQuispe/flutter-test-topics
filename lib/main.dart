import 'package:flutter/material.dart';
import 'package:flutter_test_topics/pages/home_page.dart';
import 'package:flutter_test_topics/pages/sign_in_page.dart';
import 'package:flutter_test_topics/pages/sign_up_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Ruddy\'s',
      debugShowCheckedModeBanner: false,
      initialRoute: 'sign_in',
      routes: {'home_page': (context) => HomePage(), 'sign_up': (context) => SignUpPage(), 'sign_in': (context) => SignInPage()},
    );
  }
}

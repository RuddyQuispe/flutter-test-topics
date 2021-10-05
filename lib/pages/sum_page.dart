import 'package:flutter/material.dart';

class SumPage extends StatefulWidget {
  SumPage({Key? key}) : super(key: key);

  @override
  _SumPageState createState() => _SumPageState();
}

class _SumPageState extends State<SumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Sum with 2 numbers'),
        backgroundColor: Colors.indigoAccent[600],
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

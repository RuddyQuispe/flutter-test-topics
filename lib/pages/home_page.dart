import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Account'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: Container(
        alignment: Alignment.center,
        child: SvgPicture.asset("assets/images/hello-rafiki.svg", height: _size.height * 0.30, width: _size.width * 0.30),
      ),
    );
  }
}

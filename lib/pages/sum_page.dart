import 'package:flutter/material.dart';

class SumPage extends StatefulWidget {
  SumPage({Key? key}) : super(key: key);

  @override
  _SumPageState createState() => _SumPageState();
}

class _SumPageState extends State<SumPage> {
  final _controllerFirstTextField = TextEditingController();
  final _controllerSecondTextField = TextEditingController();
  double _sumTotal = 0;
  double _firstValue = 0;
  double _secondValue = 0;

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
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Obtiene la suma de 2 numeros",
                style: TextStyle(fontSize: 15.0),
              ),
              Divider(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _controllerFirstTextField,
                  keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
                  cursorColor: Colors.greenAccent,
                  decoration: InputDecoration(hintText: "Ingresa un valor", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
                  onChanged: (value) {
                    double valueDouble = 0;
                    try {
                      valueDouble = double.parse(value);
                    } on FormatException {
                      valueDouble = 0;
                    } finally {
                      this.setState(() {
                        _firstValue = valueDouble;
                        _sumTotal = _firstValue + _secondValue;
                      });
                    }
                  },
                ),
              ),
              Divider(height: 5),
              Text(
                "+",
                style: TextStyle(fontSize: 15.0),
              ),
              Divider(height: 5),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _controllerSecondTextField,
                  keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
                  cursorColor: Colors.greenAccent,
                  decoration: InputDecoration(hintText: "Ingresa otro valor", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
                  onChanged: (value) {
                    double valueDouble = 0;
                    try {
                      valueDouble = double.parse(value);
                    } on FormatException {
                      valueDouble = 0;
                    } finally {
                      this.setState(() {
                        _firstValue = valueDouble;
                        _sumTotal = _firstValue + _secondValue;
                      });
                    }
                  },
                ),
              ),
              Divider(height: 5),
              Text(
                "=",
                style: TextStyle(fontSize: 15.0),
              ),
              Divider(height: 5),
              Text(
                _sumTotal.toString(),
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

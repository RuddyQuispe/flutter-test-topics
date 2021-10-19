import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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
                      // ignore: unnecessary_this
                      this.setState(() {
                        _firstValue = valueDouble;
                        // dont update value total sum
                        // _sumTotal = _firstValue + _secondValue;
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
                        _secondValue = valueDouble;
                        // dont update sume total
                        // _sumTotal = _firstValue + _secondValue;
                      });
                    }
                  },
                ),
              ),
              Divider(height: 5),
              ElevatedButton(
                  child: Text(
                    "Click Here",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: _sum),
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

  void _sum() async {
    var dio = Dio();
    try {
      Response response = await dio.post('http://192.168.100.4:5000/sum_web', data: {'first_value': this._firstValue.toString(), 'second_value': this._secondValue.toString()});
      Map data = response.data;
      print(data);
      this.setState(() {
        _sumTotal = double.parse(data['result']);
      });
    } catch (e) {
      print("Error with Post Method \n$e");
      // return {"error": "ERROR_WITH_POST_METHOD"};
    }

    // var client = http.Client();
    // try {

    //   print('Response status: ${response.statusCode}');
    //   print('Response body: ${response.body}');
    //   // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    //   // var uri = Uri.parse(decodedResponse['uri'] as String);
    //   print(await client.get(Uri.parse('http://192.168.100.4:5000/sum_web')));
    // } finally {
    //   client.close();
    // }
  }
}

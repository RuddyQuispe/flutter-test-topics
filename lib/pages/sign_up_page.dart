import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_topics/config/database.dart';
import 'package:flutter_test_topics/model/user.dart';

class SignUpPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _controllerIDTextField = TextEditingController();
  final _controllerNameTextField = TextEditingController();
  final _controllerEmailTextField = TextEditingController();
  final _controllerPhonTextField = TextEditingController();
  final _controllerAddressTextField = TextEditingController();
  final _controllerPasswordTextField = TextEditingController();
  User _user = User();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Account'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/mobile-login-pana.svg", height: _size.height * 0.30, width: _size.width * 0.30),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _controllerIDTextField,
                  keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
                  cursorColor: Colors.greenAccent,
                  decoration: InputDecoration(hintText: "ID", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
                  onChanged: (value) {
                    if (value == "") {
                      setState(() {
                        _user.id = 0;
                      });
                    } else {
                      setState(() {
                        _user.id = int.parse(value);
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _controllerNameTextField,
                  keyboardType: TextInputType.name,
                  cursorColor: Colors.greenAccent,
                  decoration: InputDecoration(hintText: "Name", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
                  onChanged: (value) {
                    setState(() {
                      _user.name = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _controllerEmailTextField,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.greenAccent,
                  decoration: InputDecoration(hintText: "Email", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
                  onChanged: (value) {
                    setState(() {
                      _user.email = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _controllerPhonTextField,
                  keyboardType: TextInputType.phone,
                  cursorColor: Colors.greenAccent,
                  decoration: InputDecoration(hintText: "Phone", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
                  onChanged: (value) {
                    setState(() {
                      _user.phone = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _controllerAddressTextField,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.greenAccent,
                  decoration: InputDecoration(hintText: "Address", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
                  onChanged: (value) {
                    setState(() {
                      _user.address = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _controllerPasswordTextField,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  cursorColor: Colors.greenAccent,
                  decoration: InputDecoration(hintText: "Password", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
                  onChanged: (value) {
                    setState(() {
                      _user.password = value;
                    });
                  },
                ),
              ),
              ElevatedButton(
                child: Text(
                  "Sign Up Account",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: _registerAccount,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _registerAccount() async {
    // print("${_user.id} ${_user.name} ${_user.email} ${_user.address} ${_user.password} ${_user.phone}");
    await DB.create(_user);
    List<User> users = await DB.users();
    print("-------------------------------------------------------------------------------------------------------");
    print("----------------------------------List User Saved------------------------------------------------------");
    for (User userDB in users) {
      print(userDB.toString());
    }
    print("-------------------------------------------------------------------------------------------------------");
    print("----------------------------------./List User Saved------------------------------------------------------");
    Navigator.of(context).pushNamedAndRemoveUntil('home_page', (Route<dynamic> route) => true);
  }
}

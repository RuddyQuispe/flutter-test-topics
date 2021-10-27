import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_topics/config/database.dart';
import 'package:flutter_test_topics/model/user.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _controllerEmailTextField = TextEditingController();
  final _controllerPasswordTextField = TextEditingController();
  User _user = User();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/mobile-login-cuate.svg", height: _size.height * 0.30, width: _size.width * 0.30),
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
                    }),
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
                  "Sign In",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: _sigIn,
              ),
              ElevatedButton(
                child: Text(
                  "Sign Up Account",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil('sign_up', (Route<dynamic> route) => true);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _sigIn() async {
    String email = _user.email!;
    List<User> users = await DB.userByID(email);
    for (User userDB in users) {
      if (userDB.password == _user.password) {
        Navigator.of(context).pushNamedAndRemoveUntil('home_page', (Route<dynamic> route) => true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("CUenta no encontrada o datos incorrectos"),
        ));
      }
    }
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _userName = '', _password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xff00abff),
        appBar: AppBar(
          title: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, 'init');
            },
            child: Icon(
              FontAwesomeIcons.angleLeft,
              size: 20,
            ),
          ),
          backgroundColor: Color(0xff00abff),
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                'Welcome\nBack',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) => _userName = value,
                      validator: (value) => value!.length < 4
                          ? 'Minimum 4 character is required'
                          : null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        hintText: 'username',
                        icon: Icon(
                          Icons.face,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) => _password = value,
                      obscureText: true,
                      validator: (value) => value!.length < 10
                          ? 'Password Must be at least of 10 character'
                          : null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Password',
                        icon: Icon(
                          FontAwesomeIcons.unlockAlt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          _loginForm();
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff007bff),
                            onPrimary: Colors.white),
                        child: Text('Log In'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, onPrimary: Colors.blueAccent),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'signUp');
                  },
                  child: Text('Sign Up'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _loginForm() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      _loginAction();
    } else {
      print('Invalid Login');
    }
  }

  void _loginAction() async {
    var url = Uri.https('nepquiz.herokuapp.com', '/auth/local');
    print(url);
    var response = await http.post(
      url,
      body: {
        'identifier': _userName,
        'password': _password,
      },
    );
    final jsonData = json.decode(response.body);
    print(jsonData);
    Navigator.pushReplacementNamed(context, 'dashboard');
  }
}

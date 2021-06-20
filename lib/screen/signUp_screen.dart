import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _userName = '', _password = '', _email = '', _confirmPass = '';
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
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Create Account',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
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
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) => _email = value,
                        validator: (value) =>
                            value!.contains('@') ? 'Invalid Email ' : null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Email',
                          icon: Icon(
                            Icons.mail,
                            color: Colors.white,
                          ),
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
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) => _confirmPass = value,
                      obscureText: true,
                      validator: (value) => value!.length < 10
                          ? 'Password Must be at least of 10 character'
                          : null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Password',
                        hintText: 'Confirm Password',
                        icon: Icon(
                          FontAwesomeIcons.unlockAlt,
                          color: Colors.white,
                        ),
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
                  onPressed: () {
                    _submitForm();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff007bff), onPrimary: Colors.white),
                  child: Text('Sign Up'),
                ),
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
                    Navigator.pushReplacementNamed(context, 'login');
                  },
                  child: Text('Login'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    final form = _formKey.currentState;
    if (form!.validate() && _password == _confirmPass) {
      _signUpAction();
    } else {
      print('Invalid Form');
    }
  }

  void _signUpAction() async {
    var url = Uri.https('nepquiz.herokuapp.com', '/auth/local/register');
    print(url);
    var response = await http.post(
      url,
      body: {
        'username': _userName,
        'email': _email,
        'password': _password,
      },
    );
    final jsonData = json.decode(response.body);
    print(jsonData);
    Navigator.pushReplacementNamed(context, 'login');
  }
}

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff007bff),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .5,
          ),
          Text(
            'NepQuiz',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
          Text(
            "Let's Play and Learn Together",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'signUp');
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff007bff), onPrimary: Colors.white),
                child: Text('Sign Up'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

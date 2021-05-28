import 'package:flutter/material.dart';
import 'package:nepquiz/ui/result.dart';
import 'package:nepquiz/ui/welcome.dart';
import 'package:nepquiz/ui/quiz_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff1f1d26),
        scaffoldBackgroundColor: Color(0xff252c4a)),
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      "/": (context) => App(),
      "init": (context) => App(),
      "quiz": (context) => Quiz(),
      "result": (context) => Result(),
    },
  ),);
}

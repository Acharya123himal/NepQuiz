import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:nepquiz/screen/screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    NeumorphicApp(
      theme: NeumorphicThemeData(
        baseColor: Color(0xff1f1d26),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'init',
      routes: {
        "dashboard": (context) => Dashboard(),
        "init": (context) => HomeScreen(),
        "quiz": (context) => PlayQuiz(),
        "result": (context) => Result(),
        'login': (context) => LoginScreen(),
        'signUp': (context) => SignUpScreen(),
      },
    ),
  );
}

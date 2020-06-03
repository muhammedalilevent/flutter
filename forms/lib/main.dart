import 'package:flutter/material.dart';
import 'package:forms/textFieldOzellikleri.dart';
import 'FormveTextFormfield.dart';
import 'deneme123.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ders",
      home: FormveTextFormfield(),
    );
  }
}


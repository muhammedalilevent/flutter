import 'package:flutter/material.dart';
import 'package:jsonapi/local_json.dart';

import 'remote_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ders",
      home: RemoteApiKullanimi(),
    );
  }
}

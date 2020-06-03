import 'package:flutter/material.dart';
import 'package:levent/efficient_list_ornek.dart';

import 'custom_scroll_view.dart';
import 'liste_dersleri.dart';
import 'grid_view.dart';

void main()
{
  runApp(MaterialApp(
    title: "Flutter Dersleri",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.orange,
    ),
    home: Scaffold(
      appBar: AppBar(title: Text("Liste Dersleri",style: TextStyle(color: Colors.white),),),
      body: CSVOrnek(),
    ),
  ));
}
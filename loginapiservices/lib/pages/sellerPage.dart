import 'package:flutter/material.dart';

class Sellers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sellers'
      ),
      ),
      body: Column(
        children: <Widget>[
          Text("ispanyolca bişler"),
          RaisedButton(
            child: Text("Exit"),
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/LoginPage');
            },
          ),
        ],
      ),
    );
  }
}

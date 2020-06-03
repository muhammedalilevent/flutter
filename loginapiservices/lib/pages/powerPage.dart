import 'package:flutter/material.dart';

class Power extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Power'
      ),
      ),
      body: Column(
        children: <Widget>[
          Text("Satıştayız"),
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

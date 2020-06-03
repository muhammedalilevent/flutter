import 'package:flutter/material.dart';

class CSVOrnek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text("Sliver App Bar"),
          backgroundColor: Colors.red,
          expandedHeight: 200,
          floating: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(sabitListeElemanlari()),
        )
      ],
    );
  }

  List<Widget> sabitListeElemanlari() {
    return [
      Container(
        height: 150,
        color: Colors.amber,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 1",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.orange,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 1",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 1",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.purple,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 1",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.green,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 1",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    ];
  }
}

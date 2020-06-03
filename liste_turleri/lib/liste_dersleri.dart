import 'package:flutter/material.dart';

class ListeKonuAnlatimi extends StatelessWidget {
  //Liste için veri kaynağı oluştur
  List<int> listeNumaralari = List.generate(300, (index) => index);
  List<String> listeAltBaslik =
      List.generate(300, (index) => "Liste elemanı alt başlık $index ");

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listeNumaralari
          .map(
            (oAnkiEleman) => Column(
              children: <Widget>[
                Container(
                  child: Card(
                    color: Colors.teal.shade100,
                    margin: EdgeInsets.all(20),
                    elevation: 10,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.android),
                        radius: 12,
                      ),
                      subtitle: Text("Liste Elemanı Başlık $oAnkiEleman"),
                      trailing: Icon(Icons.add_circle),
                    ),
                  ),
                ),
                Divider(color: Colors.orange, height: 32, indent: 20),
              ],
            ),
          )
          .toList(),
    );
  }
}

/*
      ],*/

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'models/Gonderi.dart';

class RemoteApiKullanimi extends StatefulWidget {
  @override
  _RemoteApiKullanimiState createState() => _RemoteApiKullanimiState();
}

class _RemoteApiKullanimiState extends State<RemoteApiKullanimi> {
  Gonderi gonderi;

  Future<Gonderi> _gonderiGetir() async {
    var response =
        await http.get("https://jsonplaceholder.typicode.com/posts/1");
    if (response.statusCode == 200) {
      return Gonderi.fromJsonMap(json.decode(response.body));
    } else {
      throw Exception("Bağlanamadık " + response.statusCode.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _gonderiGetir().then((okunanGonderi) {
      gonderi = okunanGonderi;
      debugPrint("gelen değer" + gonderi.title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remote Api"),
      ),
      body: FutureBuilder(
          future: _gonderiGetir(),
          builder: (BuildContext context, AsyncSnapshot<Gonderi> snapshot) {
            if (snapshot.hasData) {
              return  ListTile(
                title: Text(snapshot.data.title),
                subtitle: Text(snapshot.data.body),
                leading: CircleAvatar(
                  child: Text(snapshot.data.id.toString()),
                ),
              );
            } else {}
          }),
    );
  }
}

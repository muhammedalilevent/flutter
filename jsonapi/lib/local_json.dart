import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:jsonapi/models/Araba.dart';

class LocalJsonKullanimi extends StatefulWidget {
  @override
  _LocalJsonKullanimiState createState() => _LocalJsonKullanimiState();
}

class _LocalJsonKullanimiState extends State<LocalJsonKullanimi> {
  List<Araba> tumArabalar;
  @override
  Widget build(BuildContext context) {
    veriKaynaginiOku();
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Json Kullanımı"),
      ),
      body: Container(
        child: Center(
          child: Text("aaaa"),
        ),
      ),
    );
  }
  veriKaynaginiOku() async {
   /*Future<String> jsonOku =  DefaultAssetBundle.of(context).loadString("assets/data/araba.json");
   jsonOku.then((okunanJson){
      debugPrint("gelen json= "+okunanJson);
      return okunanJson;

   });*/
    var gelenJson=await DefaultAssetBundle.of(context).loadString("assets/data/araba.json");
    debugPrint("gelen json= "+gelenJson);

    List<Araba> arabaListesi= (json.decode(gelenJson) as List).map((mapYapisi) => Araba.fromJsonMap(mapYapisi)).toList();
    debugPrint("toplam araba Sayısı "+arabaListesi.length.toString() );
    for(int i=0; i<arabaListesi.length; i++)
      {
        debugPrint("Markalar : "+arabaListesi[i].araba_adi.toString());
        debugPrint("Markalar : "+arabaListesi[i].ulke.toString());
      }
    return arabaListesi;
  }
}

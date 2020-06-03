import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EtkinListeOrnek extends StatelessWidget {
  List<Ogrenci> tumOgrenciler = [];

  @override
  Widget build(BuildContext context) {
    ogrenciVerileriniGetir();
    //ListView.Seperated her satır arasına koymasını istediğin bir widgeti koyar
    return ListView.separated(
      separatorBuilder: (context, index) {
        //return Divider();
        if (index % 4 == 0 && index != 0) {
          return Container(
            height: 2,
            color: Colors.blue,
          );
        } else {
          return Divider();
        }
      },
      itemCount: 20,
      itemBuilder: (context, index) => Card(
        color: index % 2 == 0 ? Colors.red.shade300 : Colors.orange,
        elevation: 4,
        child: ListTile(
          leading: Icon(Icons.perm_identity),
          title: Text(tumOgrenciler[index]._isim),
          subtitle: Text(tumOgrenciler[index]._aciklama),
          trailing: Icon(Icons.android),
          onTap: () {
            toastMessage(index, false);
            showAlertDialog(context);
          },
          onLongPress: () {
            toastMessage(index, true);
          },
        ),
      ),
    );
  }

  void toastMessage(int index, bool uzunBasim) {
    Fluttertoast.showToast(
      msg: uzunBasim
          ? "Uzun Basıldı" + tumOgrenciler[index].toString()
          : "Kısa Basıldı" + tumOgrenciler[index].toString(),
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
    );
  }

  void ogrenciVerileriniGetir() {
    tumOgrenciler = List.generate(
        300,
        (index) => Ogrenci("Ogrenci $index adı", "ogrenci $index açıklama",
            index % 2 == 0 ? true : false));
  }

  void showAlertDialog(BuildContext ctx) {
    showDialog(
        context: ctx,
        barrierDismissible: false,
        builder: (ctx) {
          return AlertDialog(
              title: Text("Alert Dialog Başlığı"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text("Alert Dialog content 1"),
                   /* Text("Alert Dialog content 2"),
                    Text("Alert Dialog content 3"),
                    Text("Alert Dialog content 4"),
                    Text("Alert Dialog content 2"),
                    Text("Alert Dialog content 2"),
                    Text("Alert Dialog content 2"),
                    Text("Alert Dialog content 2"),
                    Text("Alert Dialog content 2"),
                    Text("Alert Dialog content 2"),
                    Text("Alert Dialog content 2"),
                    Text("Alert Dialog content 2"),
                    Text("Alert Dialog content 2"),
                    Text("Alert Dialog content 2"),
                    Text("Alert Dialog content 2"),
                    Text("Alert Dialog content 2"),*/
                  ],
                ),
              ),
              actions: <Widget>[
                ButtonBarTheme(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text("Tamam"),
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: Text("Olmaz"),
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                      ),
                    ],
                  ),
                )
              ]);
        });
  }
}

class Ogrenci {
  String _isim;
  String _aciklama;
  bool _cinsiyet;

  Ogrenci(this._isim, this._aciklama, this._cinsiyet);

  @override
  String toString() {
    // TODO: implement toString
    return "Seçilen öğrenci adı: $_isim açıklaması : $_aciklama";
  }
}

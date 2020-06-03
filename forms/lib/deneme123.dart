import 'package:flutter/material.dart';

class deneme123 extends StatefulWidget {
  @override
  _deneme123State createState() => _deneme123State();
}

class _deneme123State extends State<deneme123> {
  String _adSoyad, sifre, email;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor: Colors.blueAccent.shade700, hintColor: Colors.pink),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.save),
        ),
        appBar: AppBar(
          title: Text("Form ve TextFormField"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            autovalidate: true,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    hintText: "Adınız ve Soyadınız",
                    labelText: "Ad ve Soyad",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (String girilenVeri)  {
                    if(girilenVeri.length < 6) {
                      return "Hata Var!";
                    }else return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email Adresiniz",
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2)),
                  ),
                  validator: (String girilenVeri) => "",
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    hintText: "Adınız ve Soyadınız",
                    labelText: "Ad ve Soyad",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (String girilenVeri) => "",
                ),
                SizedBox(height: 10),
                RaisedButton.icon(
                  icon: Icon(Icons.save),
                  label: Text("Kaydet"),
                  onPressed: () {
                    _girisBilgileriniOnayla;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _girisBilgileriniOnayla() {}
}

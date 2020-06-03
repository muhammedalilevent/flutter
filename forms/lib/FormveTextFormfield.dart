import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormveTextFormfield extends StatefulWidget {
  @override
  _FormveTextFormfieldState createState() => _FormveTextFormfieldState();
}

class _FormveTextFormfieldState extends State<FormveTextFormfield> {
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
                  validator: (String girilenVeri) {
                    if (girilenVeri.length < 6) {
                      return "Hata Var!";
                    } else
                      return null;
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
                  validator: _emailKontrol,
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    hintText: "Şifee",
                    labelText: "Şifre",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (String girilenVeri){
                    if(girilenVeri.length<6)
                      return "en az 6 karakter gerekli";
                  },
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton.icon(
                    icon: Icon(Icons.save),
                    label: Text("Kaydet"),
                    onPressed: () {
                      _girisBilgileriniOnayla;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton.icon(
                    icon: Icon(Icons.book),
                    label: Text("Kayıt Ol"),
                    onPressed: () {
                      //Buraya SignUp page Yönlendirmesi yazılacak
                    },
                  ),
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

String _emailKontrol(String mail) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(mail))
    return 'Geçersiz mail';
  else
    return null;
}

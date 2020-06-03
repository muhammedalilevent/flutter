import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'homepage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Controller Tanımlamaları
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerSurname = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //API STUFF
    Future<List> signUp() async {
      debugPrint("signUp fonks girildi");
      final response = await http
          .post("http://leventsoftware.com/myApi/flutter/login.php", body: {
        //URL DEĞİŞTİRİLECEK
        "first_name": controllerName.text,
        "last_name": controllerSurname.text,
        "email": controllerEmail.text,
        "phone": controllerPhone.text,
        "password": controllerPassword.text,
      });
      var datauser = json.decode(response.body);

      if (datauser != null) {
        var message =
            datauser['message'] != null ? datauser['message'] : 'Başarısız';
        if (datauser['success'] == true) {
          debugPrint("MESAJ:" + message);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) => HomePage()));
        } else {
          debugPrint("MESAJ:" + message);
        }
      }
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        autovalidate: true,
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.height / 4,
              alignment: Alignment.centerLeft,

              //SpaceBetween Eklencek

              child: Text(
                "KAYIT OL",
                style: TextStyle(fontSize: 35, color: Colors.blue),
              ),
            ),
            Container(
                padding:
                    EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: controllerName,
                  obscureText: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Ahmet",
                    labelText: "Adınız",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  //validator: _nameControl,
                )),
            Container(
              padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.white,
              ),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: controllerSurname,
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Demir",
                  labelText: "Soyadınız",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                validator: _surnameControl,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.white,
              ),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: controllerPhone,
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  hintText: "+905448458795",
                  labelText: "Telefon Numarası",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                validator: _phoneControl,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.white,
              ),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: controllerEmail,
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: "abc123@gmail.com",
                  labelText: "E-mail",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                validator: _emailControl,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.white,
              ),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: controllerPassword,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  hintText: "******",
                  labelText: "Şifre",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.white,
              ),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: controllerName,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  hintText: "******",
                  labelText: "Şifre Tekrar",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                validator: _passwordControl,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              height: 50,
              width: 200,
              child: RaisedButton(
                highlightColor: Colors.green.shade800,
                hoverColor: Colors.red,
                color: Colors.blueAccent,
                child: Text(
                  'Kayıt ol',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      textBaseline: TextBaseline.alphabetic),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  signUp();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _nameControl(String name) {
    if (name.length < 1) {
      return "Bu Alanı Boş Bırakamazsınız";
    } else {
      return null;
    }
  }

  String _surnameControl(String surname) {
    if (surname.length < 1) {
      return "Bu Alanı Boş Bırakamazsınız";
    } else {
      return null;
    }
  }

  String _phoneControl(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value.length == 0) {
      return 'Bu alanı Boş Bırakamazsınız';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  String _emailControl(String mail) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(mail))
      return 'Geçersiz mail';
    else
      return null;
  }

  String _passwordControl(String value) {
    if (value.length < 6) {
      return "Şifreniz en az 6 haneli olmalıdır";
    } else
      return null;
  }
}

import 'package:flutter/material.dart';
import 'package:loginapiservices/pages/powerPage.dart';
import 'package:loginapiservices/pages/sellerPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(LoginApp());
String userName;

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter + MySql',
        home: LoginPage(),
        routes: <String, WidgetBuilder>{
          '/powerPage': (BuildContext context) => new Power(),
          '/sellerPage': (BuildContext context) => new Sellers(),
          '/LoginPage': (BuildContext context) => LoginPage()
        });
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  String message = '';

  Future<List> login() async {
    debugPrint("login fonks girildi");
    final response = await http
        .post("http://leventsoftware.com/myApi/flutter/login.php", body: {
      "username": controllerEmail.text,
      "password": controllerPass.text,
    });
    //debugPrint("http Post Çalıştırıldı"+response.statusCode.toString()+" "+response.body);

    var datauser = json.decode(response.body);

    if (datauser != null) {
      var mesaage =
          datauser['message'] != null ? datauser['message'] : 'Başarısız';
      if (datauser['success'] == true) {
        debugPrint("MESAJ:" + mesaage);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => Sellers()));
      } else {
        debugPrint("MESAJ:" + mesaage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        autovalidate: true,
        child: Container(
          height: MediaQuery.of(context).size.height ,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                width: 170.0,
                height: 170.0,
                padding: EdgeInsets.only(top: 77.0),
                child: CircleAvatar(
                  backgroundColor: Color(0xFFFFFF),
                  child: Image(
                    width: 135,
                    height: 135,
                    image: AssetImage("assets/images/parkingLot.png"),
                  ),
                ),

                decoration: BoxDecoration(shape: BoxShape.circle),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 90),
                child: Column(
                  children: <Widget>[
                    Container(
                      //TFF EMAİL KONTEYNIRI
                      width: MediaQuery.of(context).size.width / 1.2,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: controllerEmail,
                        obscureText: false,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          hintText: "abc@tmail.com",
                          labelText: "E-mail",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2)),
                        ),
                        validator: _emailKontrol,
                      ),
                    ),
                    Container(
                      //TEXTFORM FİELD ŞİFRE ALANI KONTEYNIRI
                      width: MediaQuery.of(context).size.width / 1.2,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: controllerPass,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          hintText: "******",
                          labelText: "Şifre",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2)),
                        ),
                        validator: (String girilenVeri) {
                          if (girilenVeri.length < 6) {
                            return "Hata Var!";
                          } else
                            return null;
                        },
                      ),
                    ),
                    /*Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6, right: 32),
                        child: Text(
                          'Remember Password',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),*/
                    Spacer(),
                    Container(
                      //GİRİŞ YAP BUTONU KONTEYNIRI
                      height:50,
                      width: 200,
                      child: RaisedButton(
                        child: Text("Giriş Yap",
                            style: TextStyle(color: Colors.white)),
                        color: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          debugPrint("Tuşa Basıldı");
                          login();
                          //Navigator.pop(context);
                        },
                      ),
                    ),
                    Spacer(),
                    Container(
                      //KAYIT BUTONU KONTEYNIRI
                      height:50,
                     width: 200,
                     child: RaisedButton(
                        child: Text(
                          "Kayıt Ol",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          debugPrint("Tuşa Basıldı");
                          login();
                          //Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
}

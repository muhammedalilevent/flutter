import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class textFieldOzellikleri extends StatefulWidget {
  @override
  _textFieldOzellikleri createState() => _textFieldOzellikleri();
}

class _textFieldOzellikleri extends State<textFieldOzellikleri> {
  TextEditingController textController1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textController1=TextEditingController(text:"varsayılan");
  }
  @override
  void dispose() {
    // TODO: implement dispose
    textController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Input İşlemleri"),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                autofocus: false,
                maxLines: 3,
                controller: textController1,
                maxLength: 20,
                decoration: InputDecoration(
                  hintText: "Place Holder",
                  labelText: "Başlık",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  //Kenarlarını Oval Yapıyor
                  icon: Icon(Icons.edit),
                  prefixIcon: Icon(Icons.edit),
                  //Yazının Başında Çıkan İcon
                  suffixIcon: Icon(Icons.edit),
                  //Yazının Sonunda Çıkan İcon
                  filled: true,
                  fillColor: Colors.red.shade400,
                ),
                maxLengthEnforced: true,
                onChanged: (String s) => debugPrint("On Change" + s),
                onSubmitted: (String s) => debugPrint("On Submitted" + s),
                cursorColor: Colors.red,
              ),
            ),
            Container(
              color: Colors.teal.shade400,
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: Align(
                  alignment: Alignment.center, child: Text("Merhaba Flutter")),
            ),
          ],
        ));
  }
}

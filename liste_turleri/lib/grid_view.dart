import 'package:flutter/material.dart';

class GridViewOrnek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GridView.extent(
        //sadece extent özelliği
        //Her bir elemanın genişliği 100 olacak şekilde
        //ekrana yazdıracaktır

        maxCrossAxisExtent: 100,
        //Soldan Sağa Konulacak Eleman Sınırı
        //Bir Satıra gelebilcek max eleman sayısı
        //scrollDirection Sağa Dooğru scroll olmasını sağlar
        //scrollDirection: Axis.horizontal,
        //scroll'a ihtiyaç olmasa bile scroll yapabilirsin true yaparsan
        primary: false,
        //Her öğenin çevresinde 10px boşluk olcak
        padding: EdgeInsets.all(10),
        //sütunların arasındaki boşluk
        crossAxisSpacing: 20,
        //2 tane satır arasındaki boşluk
        mainAxisSpacing: 40,
        children: <Widget>[
          Container(
            //Texti kutunun ortasına getirdi
            alignment: Alignment.center,
            color: Colors.teal.shade300,
            child: Text(
              "Merhaba Flutter",
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            //Texti kutunun ortasına getirdi
            alignment: Alignment.center,
            color: Colors.teal.shade300,
            child: Text(
              "Merhaba Flutter",
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            //Texti kutunun ortasına getirdi
            alignment: Alignment.center,
            color: Colors.teal.shade300,
            child: Text(
              "Merhaba Flutter",
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            //Texti kutunun ortasına getirdi
            alignment: Alignment.center,
            color: Colors.teal.shade300,
            child: Text(
              "Merhaba Flutter",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      onTap: (){
        debugPrint("onTap Çalıştı ");
      },
      onDoubleTap: (){
        debugPrint("onDoubleTap Çalıştı ");
      },
      onLongPress: (){
        debugPrint("onLong Çalıştı ");
      },
    );
  }
}
//GridView.count Ornek
/*
* GridView.count(
      //Soldan Sağa Konulacak Eleman Sınırı
      //Bir Satıra gelebilcek max eleman sayısı
      crossAxisCount: 3,
      //scrollDirection Sağa Dooğru scroll olmasını sağlar
      //scrollDirection: Axis.horizontal,
      //scroll'a ihtiyaç olmasa bile scroll yapabilirsin true yaparsan
      primary: false,
      //Her öğenin çevresinde 10px boşluk olcak
      padding: EdgeInsets.all(10),
      //sütunların arasındaki boşluk
      crossAxisSpacing: 20,
      //2 tane satır arasındaki boşluk
      mainAxisSpacing: 40,
      children: <Widget>[
        Container(
          //Texti kutunun ortasına getirdi
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          //Texti kutunun ortasına getirdi
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          //Texti kutunun ortasına getirdi
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          //Texti kutunun ortasına getirdi
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
* */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sepetdemo_with_provider/MyCarts.dart';

import 'MyTheme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyCart(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyTheme(),
        ),
      ],
      child: MyAppWithTheme(
      ),
    );
  }
}
class MyAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   MyTheme myTheme =Provider.of<MyTheme>(context);
    return MaterialApp(
      home: Store(),
      theme: myTheme.themeData,
    );
  }
}


class Store extends StatelessWidget {
  final List<String> list = ['Kitap', 'Bilgisayar', 'Eşya'];

  @override
  Widget build(BuildContext context) {
    //Context istediği için build methodunun altında yazmamız lazım
    MyCart myCart = Provider.of<MyCart>(context);
    MyTheme myTheme =Provider.of<MyTheme>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Mağaza"),
        leading: IconButton(icon : Icon(Icons.lightbulb_outline),
        onPressed:(){
         myTheme.toggleTheme();
        },),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
          )
        ],
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            String item = list[index];
            return ListTile(
              title: Text(item),
              trailing: IconButton(
                icon: Icon(myCart.list.contains(item)
                    ? Icons.remove_shopping_cart
                    : Icons.add_shopping_cart),
                onPressed: () {
                  if (myCart.list.contains(item)) {
                    myCart.removeItem(item);
                  } else {
                    myCart.addItem(item);
                  }
                },
              ),
            );
          }),
    );
  }
}

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyCart myCart = Provider.of<MyCart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sepet / ${myCart.totalPrice}"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              myCart.clearCart();
            },
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(myCart.list[index]),
          );
        },
        itemCount: myCart.list.length,
      ),
    );
  }
}

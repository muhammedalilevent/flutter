import 'package:flutter/material.dart';
import 'models/todos.dart';
import 'package:intl/intl.dart';

void main() =>
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.orange,
      ),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<TodoItems> todos = [];
  String contentTemp;
  DateTime selectedDate;

//ben biraz toplayayım devam et ? okey bu kadar :D
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // debugPrint(exp1.contentTime.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  title: Text("Listeye Ekle"),
                  content: StatefulBuilder(builder: (context, mySetState) {
                    return Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Content',
                          ),
                          onChanged: (String value) {
                            setState(() {
                              contentTemp = value;
                            });
                          },
                        ),
                        RaisedButton(
                          child: Text('Deadline'),
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2222),
                            ).then((date) {
                              mySetState(() {
                                selectedDate = date;
                                // debugPrint(tempTime.toString());
                              });
                            });
                          },
                        ),
                        Text(selectedDate != null
                            ? DateFormat("dd.MM.yyyy").format(selectedDate)
                            : "Bitiş Tarihi Seç"),
                        RaisedButton(
                          child: Text("Listeye Ekle"),
                          onPressed: () {
                            setState(() {
                              TodoItems temp = TodoItems(contentTemp, false,
                                  DateTime.now(), selectedDate);
                              todos.add(temp);
                              debugPrint(temp.contentTime.toString());
                              selectedDate=null;
                              //debugPrint(todos[].content);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  }),
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todos[index].toString()),
              child: Card(
                elevation: 3,
                margin: EdgeInsets.all(6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: ListTile(
                  title: Text(todos[index].content ?? 'default value'),
                  subtitle: Text("Created at " +
                      DateFormat("dd.MM.yyyy").format(todos[index].createdAt) +
                      " \n" +
                      "Should done before " +
                      DateFormat("dd.MM.yyyy")
                          .format(todos[index].contentTime ?? 'default value')),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        todos.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
            );
          }),
    );
  }
}

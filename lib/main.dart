import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//MyApp is a StatefulWidget This allows updating the state of the
//widget when an item is removed
class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
 @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final items = List<String>.generate(10, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
   final title = 'Dismis Items';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index){
          final item = items[index];

          return Dismissible(
            //Each Dissmisible must contain a key, keys allow flutter to
            //uniquely identify widgets
            key: Key(item),
            //provide a function that tells the app
            //what to do after an item has been swiped away
            onDismissed: (direction){
              //remove the item from the data source
              setState(() {
                items.removeAt(index);
              });

              //Then show a sanckbar
              Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("$item dismissed")));
            },

            //show a red background as the item is swipped away
            background: Container(color: Colors.redAccent),
            child: ListTile(title: Text('$item')),
            );
          },
        ),
      ),
    );
  }
}
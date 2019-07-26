import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Air Port - Crazy Wave';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHome(title: appTitle),
    );
  }
}

class MyHome extends StatelessWidget {
  final String title;
  
  MyHome({Key key, this.title}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Body Page'),
      ),
      drawer: Drawer(
        child: ListView(
          //importan : remove any padding from the ListView
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("gyugie"),
              accountEmail: new Text("mugypleci@gmail.com"),
              onDetailsPressed: () {},
            ),
            ListTile(
              leading: Icon(Icons.flight_takeoff),
              title: Text('Arrival'),
              onTap:(){
                //Update the state of the app
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => ArrivalPage() ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.flight_land),
              title: Text('Depature'),
              onTap: () {
                //Update the state of the app
                //...
                 Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => DepaturePage() ),
                );
              },
            ),
          ],
        ),
      ),//add Drawer here in the next step,
    );
  }
}

class ArrivalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arrival Page'),
        ),
      body: Center(
         child: Column( // Replace with a Row for horizontal icon + text
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.flight_land, size: 50),
            ],
        ),
      ),
    );
  }
}

class DepaturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Depature',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SnackBar Demo'),
          ),
          body: SnackBarPage(),
        ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          final snackbar = SnackBar(
            content: Text('Yay A SnackBar'),
            action: SnackBarAction(
              label: "Undo",
              onPressed: () {

              },
            ),
          );

          Scaffold.of(context).showSnackBar(snackbar);
        },
        child: Text('Show SnackBar'),
      ),
    );
  }
}
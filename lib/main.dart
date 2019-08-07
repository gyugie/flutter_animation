import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Air Port - Crazy Wave';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],

        // Define the default font family.
        fontFamily: 'Montserrat',

        //Define the default Texttheme use this specify the default
        //text styling for deadlines, titles, bodies of text, and more

        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'), 
          ),
        ),
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
              title: Text('SnackBar'),
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
      body: OrientationBuilder(
        builder: (context, orientation){
          return GridView.count(
            //create a grid with 2 columns in potrait mmode, or 3 column in landscape mode
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            // Generate 100 widget that display their index in the list
            children: List.generate(100, (index){
              return Center(
                child: Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headline,
                  ),
                );
            }),
          );
        },
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
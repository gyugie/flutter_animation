import 'package:flutter/material.dart';

void main() => runApp(FadeOut());

class FadeOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TitleApps = 'Opacity Demo';
    return MaterialApp(
      title: TitleApps,
      home: MyHomePage(title: TitleApps),
    );
  }
}

//the statefull widget job is to take data and create s state class
//in this case, the widget takes a title and creates a _MyhomePageState
class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super (key : key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//the State class is responsible for two things: holdings some data you can
//update and buiolding the UI using that data
class _MyHomePageState extends State<MyHomePage> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
   // The green box goes here with some other Widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedOpacity(
          //If the widget is visible, animate to 0.0 (invisible)
          //If the widget is hiddenm animate to 1.0 (fully visible)
          opacity: _visible ? 0.0 : 1.0,
          duration: Duration(milliseconds: 1000),
          //the green box must be a child of the AnimatedOpacity widget
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Call state. This tells Flutter to rebuild the
          //UI with the changes
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: Icon(Icons.flip),
      ),
    );
  }
}
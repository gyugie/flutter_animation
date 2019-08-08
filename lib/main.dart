import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = 'Web Images';
    
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Stack(
          children: <Widget>[
            Center(child: CircularProgressIndicator()),
            Center(
              child:FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'https://fotos00.formulamoto.es/2016/05/19/646x260/ktmenduro2017.jpg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
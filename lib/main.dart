import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = 'Web Images';
    
    return MaterialApp(
      title: title,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Main Screen'),
        ),
        body: GestureDetector(
          child: Hero(
              tag: 'imageHero',
              child:FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'https://fotos00.formulamoto.es/2016/05/19/646x260/ktmenduro2017.jpg',
              ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_){
              return DetailScreen();
            }));
          },
        ),
      );
  }
}


class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'https://fotos00.formulamoto.es/2016/05/19/646x260/ktmenduro2017.jpg',
              ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
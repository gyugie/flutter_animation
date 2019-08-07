import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}


//create a form widget
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState(){
    return MyCustomFormState();
  }
}

//create a corresponding State class
// this class holds data related to the form
class MyCustomFormState extends State<MyCustomForm>{
  //create global key that uniquely identifies the form widget
  //and validation of the form

  final _formKey = GlobalKey<FormState>();

  @override 
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value){
              if(value.isEmpty){
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:16.0),
            child: RaisedButton(
              onPressed: (){
                //validate return true if the form is valid or false
                //otherwise

                if(_formKey.currentState.validate()){
                  //if the form valid show a snackbar
                  print(_formKey);
                   Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
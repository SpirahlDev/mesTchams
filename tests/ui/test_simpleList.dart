import 'package:flutter/material.dart';


void main(){
  runApp(SimpleList());
}

class SimpleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home: Scaffold(
        body: Column(
          children: [
            ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 160.0,
                color: Colors.red,
              ),
              Container(
                width: 160.0,
                color: Colors.blue,
              ),
              Container(
                width: 160.0,
                color: Colors.green,
              ),
              Container(
                width: 160.0,
                color: Colors.yellow,
              ),
              Container(
                width: 160.0,
                color: Colors.orange,
              ),
            ],
            ),
          ],
        ),
      ),
    );  
  }
}

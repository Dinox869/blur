import 'package:flutter/material.dart';
import 'package:blur/loginview.dart';

class settings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Settngs"),
            RaisedButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>
                  loginview()
              ));
            })
          ],
        ),
      ),
    );
  }

}
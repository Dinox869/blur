import 'package:flutter/material.dart';
import 'package:blur/loginview.dart';
 class home extends StatefulWidget{
  @override
  homes createState() {
    return homes();
  }
 }
 class homes extends State<home>
 {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Homes."),
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
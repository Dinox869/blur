import 'package:flutter/material.dart';

class search extends StatefulWidget{
 @override
  find createState(){
   return find();
 }
  }
  class find extends State<search>
  {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Search friends"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey),
        child: Column(
          children: <Widget>[
            Text("Your here now.")
          ],
        ),
      ),
    );
  }

  }


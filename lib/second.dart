import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class second extends StatefulWidget
{
  final Url;
  final Name;
  final Status;

  second({Key key,
    @required this.Url,
    this.Name,
    this.Status}):
        super( key: key );

  @override
  seconds createState() {

    return seconds();
  }
}

class seconds extends State<second> {
  status(follow){
    if(follow == "Unfollow"){
      return Text("Following",style: TextStyle(
        color: Colors.blue,
        fontSize: 16.0,
        fontWeight: FontWeight.bold
      ),
      );
    }else{
      return Text("Follow",style: TextStyle(
          color: Colors.blue,
          fontSize: 16.0,
          fontWeight: FontWeight.bold
      ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("clients").snapshots(),
      builder: (BuildContext context,
      AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError)
          return new Text('${snapshot.error}');
        switch(snapshot.connectionState)
        {
          case ConnectionState.waiting:
            return  new Center(
                child: new CircularProgressIndicator()
            );
          default:
            return Scaffold(
              body: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.Name,style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      height: 200,
                      width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(widget.Url),fit: BoxFit.cover
                ),
              ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      status(widget.Status)
                    ],
                  ),


                ],
              ),
            );
        }
      },
    );
  }

}

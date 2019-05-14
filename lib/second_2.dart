import 'dart:async';
import 'package:blur/third_2.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class second2 extends StatefulWidget
{

  @override
  seconds createState() {

    return seconds();
  }
}

class seconds extends State<second2> {

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("Dennis").snapshots(),
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
              appBar: AppBar(
                title: Text("WISHLIST",style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
                ),
                centerTitle: true,
              ),
              body: Container(
                decoration: BoxDecoration(
                    color: Colors.grey
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 25),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white30
                      ),
                      child: ListView(
                          padding: EdgeInsets.only(left: 15.0, right: 15.0),
                          primary: false,
                          shrinkWrap: true,
                          children: buildList(snapshot.data.documents,context)
                      ),
                    )
                  ],
                ),
              ),
            );
        }
      },
    );
  }
}
List<Widget> buildList(List<DocumentSnapshot> documents,BuildContext context){

  List<Widget> _list = [];
  for(DocumentSnapshot document in documents )
  {
    _list.add(buildListItem(document,context));
  }
  return _list;
}
Widget buildListItem(DocumentSnapshot document, BuildContext context){
  return Container(
      child: ListTile(
        title: Text(
          document.documentID,style: TextStyle(color: Colors.black,
            fontWeight: FontWeight.bold,fontSize: 16.0
        ),),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
              third_2(

                Doc: document.documentID,
              )
          ));
        },

      )
  );

}
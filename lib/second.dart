import 'dart:async';
import 'package:blur/third.dart';
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

//  NImage(url){
//    if(url = null){
//      return Hero(
//          tag: NetworkImage(url),
//          child: FadeInImage(
//              placeholder: new AssetImage("assets/person.jpg"),
//              image: NetworkImage(url))
//      );
//    }
//    else
//      {
//        return NetworkImage(url);
//      }
//  }


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
                title: Text(widget.Name,style: TextStyle(
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
                    SizedBox(height: 25.0),
                    Center(
                      child: Container(
                        height: 400,
                        width: 400,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(widget.Url)
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
                    SizedBox(height: 25),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white30
                      ),
                      child: ListView(
                          padding: EdgeInsets.only(left: 15.0, right: 15.0),
                          primary: false,
                          shrinkWrap: true,
                           children: buildList(snapshot.data.documents,context,widget.Name)
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
List<Widget> buildList(List<DocumentSnapshot> documents,BuildContext context, String name){

  List<Widget> _list = [];
  for(DocumentSnapshot document in documents )
  {
    _list.add(buildListItem(document,context,name));
  }
  return _list;
}
Widget buildListItem(DocumentSnapshot document, BuildContext context,String name){
  return Container(
    child: ListTile(
      title: Text(
        document.documentID,style: TextStyle(color: Colors.black,
          fontWeight: FontWeight.bold,fontSize: 16.0
      ),),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
        third(
          Name: name,
          Doc: document.documentID,
        )
        ));
      },

    )
  );

}
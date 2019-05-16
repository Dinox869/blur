import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blur/second.dart';

class followings extends StatefulWidget{
  final User;

  followings({Key key,
  @required
  this.User
  }): super(key : key);


  @override
  following createState(){
    return following();
  }
}

class following extends State<followings>{

  void _deletes(documentz){
     final DocumentReference documentReference = Firestore.instance.collection("${widget.User}"+"following").document(documentz);

     documentReference.delete().whenComplete((){
       print("Deleted");
       setState((){});
     }).catchError((e){
       print(e);
     });
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
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(document.data["url"]),
      ),
      title: Text(
        document.documentID,style: TextStyle(color: Colors.black,
          fontWeight: FontWeight.bold,fontSize: 16.0
      ),),
      trailing:FlatButton.icon(onPressed: (){
       //Call another method.....
        _deletes(document.documentID);
      },
          icon: Icon(Icons.thumb_down),
          label: Text("Unfollow")),
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>
            second(
              Url: document.data["url"],
              Name: document.documentID,
              Status: "follow",
            )
        ));
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("${widget.User}"+"following").snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError)
          return new Text('${snapshot.error}');
        switch(snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Center(
                child: new CircularProgressIndicator()
            );
          default:
            if(snapshot.data.documents.length <= 0){
              return new Scaffold(
                  appBar: AppBar(
                    title: Text("Following",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13
                      ),
                    ),
                  ),
                  body:Container(
                    color: Color.fromRGBO(255, 255, 255, 2.0),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Container( height: screenSize.height/3.6 ,
                            width: screenSize.width/1.6,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/searching.jpg'),
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                        ),
                        Text("No Results found.",
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              decoration: TextDecoration.underline
                          ),)
                      ],
                    ),
                  )
              );
            }
            else
            {
              return new Scaffold(
                appBar: AppBar(
                  title: Text("Following",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                body: Container(
                  color: Colors.grey,
                  child:Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                        color: Colors.white30,
                        child:  ListView(
                            padding: EdgeInsets.only(left: 15.0, right: 15.0),
                            primary: false,
                            shrinkWrap: true,
                            children: buildList(snapshot.data.documents,context)
                        ),
                      )
                    ],
                  )
                ),
              );
            }
        }
      },
    );
  }
}

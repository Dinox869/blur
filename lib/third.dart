import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class third extends StatefulWidget
{
  final Name;
  final Doc;

  third({Key key ,
    @required
    this.Name,
    this.Doc
  })
      :super(key: key);

  @override
  thirds createState() {

    return thirds();
  }
}

class thirds extends State<third>
{
 final _list = [];
  int counts;
  var document;
  @override




  Widget buildList(String doc,String docs){
    return new ListTile(
      title: Text(doc,
      ),
      trailing: FlatButton(
          onPressed: (){
            _showAlert(docs);
          },
          child: Text("Buy Item",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                decoration: TextDecoration.underline
            ),
          )),
    );
  }
  _showAlert(String doc)
  {
    return showDialog (
      context: context,
        barrierDismissible: true,
        child: AlertDialog(
          title: new Text("Visit Link"
          ),
          content:  Text("Do you wish to visit the web link?"),
          actions: <Widget>[
            new FlatButton(
                onPressed: (){
                  Navigator.of(context,rootNavigator: true).pop(context);
                },
                child: Text("No",style: TextStyle(
                  color: Colors.red
                ),
                )
            ),
            new FlatButton(
                onPressed: (){
                  _launchUrl(doc);
                },
                child: Text("Yes",style: TextStyle(
                    color: Colors.black
                ),
                )
            ),
          ],
        )
    );
  }
  _launchUrl(link) async{
    if(await canLaunch(link)){
      await launch(link);
    }
    else
    {
      throw 'Could not Launch the link';

    }
  }
  texting(dod){
    if(dod !=null){
      gettting(dod);
      return Text(widget.Name);
    }else
      return null;
  }
  Future gettting(String doc) async{
     document=  await Firestore.instance.collection('Dennis').document(doc).get();
    return document;
  }
 initstate( doc)  {


      for(int i = 0 ; i< doc.data.length~/2 ;i++)
      {
        _list.add(buildList(doc.data["item$i"],doc.data["link$i"]));
      }



  return _list ;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.Name,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
        ) ,

      ),
      body: Container(
            decoration: BoxDecoration(
                color: Colors.grey
            ),

                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                      texting(widget.Doc)
                        ],
                      ),
                    ),
//                    Expanded(
//                        child:  ListView.builder(
//                        itemCount: counts~/2,
//                        itemBuilder:  (BuildContext context, int index){
//                          return document.then((DocumentSnapshot doc){
//
//                              buildList(doc.data["item$index"],doc.data["link$index"]);
//
//                          }
//                          );
//                        }
//                    )
//                    ),
                    Expanded(child: FutureBuilder(
                      future: gettting(widget.Doc) ,
                        builder: (BuildContext context, AsyncSnapshot snapshot)
                                  {
                                  switch(snapshot.connectionState)
                                  {
                                  case ConnectionState.waiting:
                                  return  new Center(
                                  child: new CircularProgressIndicator()
                                  );
                                  default:
                                    if(snapshot.data != null) {
                                      for (int i = 0; i < 1;
                                      i++) {
                                       return buildList(snapshot.data["item$i"],
                                            snapshot.data["link$i"]);
                                      }

                                    }
                                    else
                                      {
                                        return Text("Empty");
                                      }


                                  }
                                  }
                                  )
                    )
                  ],

                ),
          )
    );
  }

}



import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class third_2 extends StatefulWidget
{

  final Doc;

  third_2({Key key ,
    @required

    this.Doc
  })
      :super(key: key);

  @override
  thirds_2 createState() {

    return thirds_2();
  }
}

class thirds_2 extends State<third_2>
{
  final _list = [];
  int counts;
  var document;
  @override




  Widget buildList(String doc,String docs){
    if (doc != null){
      return new ListTile(
        title: Text(doc,
        ),
        trailing: FlatButton(
            onPressed: (){
              _showAlert(docs);
            },
            child: Text("View Link",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  decoration: TextDecoration.underline
              ),
            )),
      );
    }
    else{
      return  new ListTile(
        title: Text(""),
      );
    }



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
  Future gettting(String doc) async{
    document=  await Firestore.instance.collection('Dennis').document(doc).get();
    return document;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.Doc,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ) ,

        ),
        body: Container(
          decoration: BoxDecoration(
              color: Colors.white10
          ),

          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(widget.Doc)
                  ],
                ),
              ),
              Expanded(
                  child:  ListView.builder(
                      itemBuilder:  (BuildContext context, int index){
                        return FutureBuilder(
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
                                    return buildList(snapshot.data["item$index"],
                                        snapshot.data["link$index"]);
                                  }
                                  else
                                  {
                                    return Text("Empty");
                                  }}}
                        );
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}


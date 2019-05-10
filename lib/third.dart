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
  int i = 0;
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
                child: ListView(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    shrinkWrap: true,
                    children: initstate(widget.Doc,context)
                ),


          )
    );
  }

}
List<Widget> initstate(String doc,BuildContext context)  {
  List<Widget> _list = [];
    var document = Firestore.instance.collection('Dennis').document(doc).get();
    document.then((DocumentSnapshot doc){
    for(int i = 0 ; i< doc.data.length/2 ;i++)
    {
      _list.add(buildList(doc.data["item$i"],doc.data["link$i"], i,context));

    }
    return _list;
  }
  );

}
Widget buildList(String doc,String docs, int i,BuildContext context){
  return new ListTile(
            contentPadding: EdgeInsets.only(left: 15, right: 25),
            title: Text(doc,
            ),
      trailing: FlatButton(
          onPressed: (){
            _showAlert(context,docs);
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
_showAlert(BuildContext context,String doc) async
{
  return showDialog(context: context,
      barrierDismissible: false,
      child: AlertDialog(
        title: new Text("Visit Link"
        ),
        content:  Text("Do you wish to visit the web link?"),
        actions: <Widget>[
          new FlatButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("No"
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
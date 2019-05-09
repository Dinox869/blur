import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  int i;
   initstate() async {
     List<Widget> list = [];
     await Firestore.instance.collection('Dennis').document('${widget.Doc}').get().then((DocumentSnapshot doc){
      for(int i = 0 ; i< doc.data.length;i++)
      {
        list.add(buildList(doc, i));

      }
    });
  }
  Widget buildList(DocumentSnapshot doc,int i){
     return new Card(
       child:Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           ListTile(
             contentPadding: EdgeInsets.only(left: 15, right: 25),
             title: Text(doc['item'+'${i}'],
               style: TextStyle(
                   color: Colors.black,
                   fontSize: 16.0,
                   fontWeight: FontWeight.bold
               ),
             ),
           ),
           FlatButton(
               onPressed: (){
                 //
               }, child: Text("Buy Item",
             style: TextStyle(
               color: Colors.black,
               fontWeight: FontWeight.bold,
               fontSize: 12.0,
               decoration: TextDecoration.underline
             ),
           )
           )
         ],
       )
     );
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            initstate(),

          ],
        ),
      ),
    );
  }

}
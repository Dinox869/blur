import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blur/first.dart';
import 'package:blur/second.dart';

class first extends StatefulWidget
{
  @override
  firsts createState() {

    return firsts();
  }
}
class firsts extends State<first>
{
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value)
  {
    if(value.length == 0)
    {
      setState((){
        queryResultSet = [];
        tempSearchStore = [];
      });
    }
    var capitalizedValue = value.substring(0,1).toUpperCase() +  value.substring(1);

    if ( queryResultSet.length  == 0 && value.length == 1)
    {
      SearchService().searchByName(value).then((QuerySnapshot docs) {
        for(int i = 0 ; i<docs.documents.length;i++){
          queryResultSet.add(docs.documents[i].data);
        }
      }
      );
    }
    else{
      tempSearchStore = [];
      queryResultSet.forEach((element){
        if (element['name'].startsWith(capitalizedValue)){
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  
  
  @override
  Widget build(BuildContext context) {

      return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled)
      {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Find Friends",style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0
              ),
              ),
              centerTitle: true,
              background: LayoutBuilder(builder: (context,constraint){
                return new Icon(Icons.people,size: constraint.biggest.height);
              }),
            ),
          )
        ];
      },
   body: Container(
     child: Column(
       children: <Widget>[
         Container(
          width: 450,
          child:   TextField(
               onChanged: (val){
                 initiateSearch(val);
               },
               decoration: InputDecoration(
                   contentPadding: EdgeInsets.only(left: 25.0,top: 25.0),
                   hintText: "Search by name.",
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(14.0)
                   )
               ),
             )
         ),
         ListView(
           padding: EdgeInsets.only(left: 10.0, right: 10.0),
           primary: false,
           shrinkWrap: true,
           children: tempSearchStore.map((element){
             return _buildResultcard(element,context);
           }).toList(),
         )
           ],
         ),
     ),
   ),
        );

  }
}

class SearchService {
  searchByName(String searchField) {
    return Firestore.instance
        .collection('clients')
        .where('superkey',
        isEqualTo: searchField.substring(0, 1).toUpperCase())
        .getDocuments();
  }
}
Widget _buildResultcard(data,BuildContext context){
  return ListTile(
    contentPadding: EdgeInsets.all(35.0),
    leading: CircleAvatar(
      backgroundImage: NetworkImage(data['url']),
    ),
    title: Text(data['name'],
    style: TextStyle(fontWeight: FontWeight.bold,
    fontSize: 15.0
    ),
    ),
    onTap: (){
      Navigator.push(context,MaterialPageRoute(builder: (context)=>
      second(
        Url: data['url'],
        Name: data['name'],
        Status: data['follow']
      )
      ));

    },
    selected: true,
    trailing:
    (data['follow'] == "1")?
        FlatButton.icon(onPressed: (){},
            icon: Icon(Icons.thumb_down),
            label: Text("Unfollow",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 12.0
            ),
            )):
        FlatButton.icon(onPressed: (){}, icon: Icon(Icons.thumb_up), label: Text("Follow",
            style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 12.0
        ),))
  );
}


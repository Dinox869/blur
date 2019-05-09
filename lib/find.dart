import 'package:flutter/material.dart';
import 'package:blur/home.dart';
import 'package:blur/settings.dart';

 class find extends StatefulWidget
 {
  @override
  friends createState() {
    
    return friends();
  }
 }
   class friends extends State<find>
   {
     int _currentIndex = 0;
     final List<Widget> _children = [
       find(),
       home(),
       settings(),
       home()
     ];

     void onTapTapped(int index){
       setState(() {
         _currentIndex = index;
       });

     }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Find Friends",style:
              TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
              ),
              background: LayoutBuilder(builder: (context,constraint){
                return new Icon(Icons.people,size: constraint.biggest.height,);
              }),
            ),
          ),
          SliverList(
              delegate:  SliverChildListDelegate(
                  [
                    
                  ]
              )
          )
        ],
      ),
    );
  }

   }
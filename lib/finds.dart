import 'package:flutter/material.dart';
import './profile.dart' as profile;
import './settings.dart' as settings;
import './search.dart' as search;
import './first.dart' as first;

class finds extends StatefulWidget
{
  @override
  searchs createState() {
    return searchs();
  }
}
 class searchs extends State<finds> with SingleTickerProviderStateMixin
 {
   
   TabController controller;
   void initState(){
     super.initState();
      controller = new TabController(length: 4, vsync: this);
   }

  @override
  Widget build(BuildContext context) {
    Size ScreenSize = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: new Material(
        color: Colors.blueGrey,
        child: new TabBar(
            controller: controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.list)),
            new Tab(icon: Icon(Icons.person)),
            new Tab(icon: Icon(Icons.home)),
            new Tab(icon: Icon(Icons.settings))
          ],
        ),
      ),
      body: new TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
          children: <Widget>[
            new first.first(),
            new profile.profile(),
            new settings.settings(),
            new settings.settings()
          ]

      ),
    );
  }

 }

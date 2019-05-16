import 'package:flutter/material.dart';
import 'package:blur/loginview.dart';

class settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text("Settings", style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0
                  ),
                  ),
                  centerTitle: true,
                  background: LayoutBuilder(builder: (context, constraint) {
                    return new Icon(
                        Icons.settings, size: constraint.biggest.height);
                  }),
                ),
              )
            ];
          },
          body: Container(
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 17),
                  ListTile(
                    onTap: () {
                      //
                    },
                    selected: true,
                    leading: Text("Notification",
                      style: TextStyle(color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(Icons.play_arrow, color: Colors.black),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      //
                    },
                    selected: true,
                    leading: Text("Privacy",
                      style: TextStyle(color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(Icons.play_arrow, color: Colors.black),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      //
                    },
                    selected: true,
                    leading: Text("Help",
                      style: TextStyle(color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(Icons.play_arrow, color: Colors.black),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      //
                    },
                    selected: true,
                    leading: Text("Premium",
                      style: TextStyle(color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(Icons.play_arrow, color: Colors.black),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      //
                    },
                    selected: true,
                    leading: Text("About",
                      style: TextStyle(color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(Icons.play_arrow, color: Colors.black),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    selected: true,
                    leading: Text("LOG OUT",
                      style: TextStyle(color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(Icons.play_arrow, color: Colors.black),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        )
    );
  }
}
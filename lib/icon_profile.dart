import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blur/second_2.dart';
import 'package:blur/follwers.dart';
import 'package:blur/following.dart';


class icon_profile extends StatefulWidget{
  @override
  icon_profiles createState() {
    return icon_profiles();
  }
}
class icon_profiles extends State<icon_profile>
{



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Center(
              child: Container(
                height: 400,
                width: 400,
                child: Hero(
                    tag: NetworkImage("https://firebasestorage.googleapis.com/v0/b/blur-ca5d8.appspot.com/o/dinox.jpeg?alt=media&token=e67c156c-863e-49b6-9756-1e23f80a08fe"),
                    child: FadeInImage(
                        placeholder: new AssetImage("assets/person.png",),
                        fit: BoxFit.cover,
                        height: 450,
                        width: 450,
                        image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/blur-ca5d8.appspot.com/o/dinox.jpeg?alt=media&token=e67c156c-863e-49b6-9756-1e23f80a08fe"))
                ),
                constraints: new BoxConstraints.expand(height: 450,width: 450),
              ),
            ),
            SizedBox(height: 110),
            Center(
            child: Container(
              color: Colors.white,
              constraints: new BoxConstraints.expand(height: 232,width: 650),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 17),
                  ListTile(
                    onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>
                            second2()
                        ));
                    },
                    selected: true,
                    leading: Text("WISHLISH",
                    style: TextStyle(color: Colors.black,
                    fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    trailing: Icon(Icons.play_arrow,color: Colors.black),
                  ),
                  Divider(),
                  ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          follwers(
                            //Username............
                            User: "Dennis",
                          )
                      ));
                    },
                    selected: true,
                    leading: Text("Followers",
                      style: TextStyle(color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(Icons.play_arrow,color: Colors.black),
                  ),
                  Divider(),
                  ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          followings(
                            //Username............
                            User: "Dennis",
                          )
                      ));

                    },
                    selected: true,
                    leading: Text("Following",
                      style: TextStyle(color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(Icons.play_arrow,color: Colors.black),
                  ),

                ],
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}
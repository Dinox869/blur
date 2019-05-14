import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blur/second_2.dart';


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
                    tag: NetworkImage("https://firebasestorage.googleapis.com/v0/b/blur-ca5d8.appspot.com/o/mary.png?alt=media&token=a4ffb118-835e-4af9-91fe-e9461698208d"),
                    child: FadeInImage(
                        placeholder: new AssetImage("assets/person.png",),
                        fit: BoxFit.cover,
                        height: 450,
                        width: 450,
                        image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/blur-ca5d8.appspot.com/o/mary.png?alt=media&token=a4ffb118-835e-4af9-91fe-e9461698208d"))
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
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blur/main.dart';

class loginview extends StatelessWidget
{
  final User;
   loginview({this.User});



  final email = TextEditingController();
  final password = TextEditingController();




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Log in"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey),
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: email,
                decoration: new InputDecoration(
                  labelText: User.displayName,
                  fillColor:  Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
              ),
              SizedBox(height: 50.0),
              TextFormField(
                controller: password,
                obscureText: true,
                decoration: new InputDecoration(
                  labelText: "Enter Password",
                  fillColor:  Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              RaisedButton.icon(
                  onPressed: ()
                  {



                  },
                  icon: Icon(Icons.check,
                  color: Colors.white,
                  ),
                  color: Colors.blueGrey,
                  label: Text("Submit",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0
                  ),
                  ))
            ],
          ),
        ),

      ),
    );
  }
}
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:blur/first.dart';
import 'package:image_picker/image_picker.dart';
class profile extends StatefulWidget{
  @override
  profiles createState(){
    return profiles();
  }
}

class profiles extends State<profile>{
  bool isCheck = false;

  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirm_password = TextEditingController();
  Future<File> imagefile;

  _pickimagefromgalley(ImageSource source){
    setState(() {
      imagefile = ImagePicker.pickImage(source: source);
    });
    }

  Widget showImage(){
    return FutureBuilder<File>(
      future: imagefile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot){
        if(snapshot.connectionState == ConnectionState.done && snapshot.data != null  )
         {
           return CircleAvatar(
             radius: 180,
             backgroundColor: Colors.transparent,
             child: ClipOval(
               child: Image.file(
            snapshot.data,
            fit: BoxFit.fill,
            height: 300,
            width: 300,
             ),
           )
           );
        }else if(snapshot.error != null){
          return const Text('Error Picking Image',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black,
          fontSize: 16,
            fontWeight: FontWeight.bold
          ),
          );
        }
        else
          {
            return  Container(
              child: Column(
                children: <Widget>[
                    Image.asset("assets/person.png",
                    fit: BoxFit.fill,
                    ),
                ],
              ),
            );
          }
      },
    );
  }

  _conditions() {
    if (username.text.length <= 0) {
      return showDialog(
          context: context,
          barrierDismissible: true,
          child: AlertDialog(
            title: new Text("Incomplete"
            ),
            content: Text("Write Username."),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context,rootNavigator: true).pop(context);
                  },
                  child: Text("Ok", style: TextStyle(
                      color: Colors.black
                  ),
                  )
              ),
            ],
          )
      );
    }
    else if (email.text.length <= 0) {
      return showDialog(
          context: context,
          barrierDismissible: true,
          child: AlertDialog(
            title: new Text("Incomplete"
            ),
            content: Text("Write Email."),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context,rootNavigator: true).pop(context);
                  },
                  child: Text("Ok", style: TextStyle(
                      color: Colors.black
                  ),
                  )
              ),
            ],
          )
      );
    } else if (password.text != confirm_password.text || password.text.length<=0 || confirm_password.text.length<=0) {
      return showDialog(
          context: context,
          barrierDismissible: true,
          child: AlertDialog(
            title: new Text("Incorrect"
            ),
            content: Text("Review the Passwords don't match."),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context,rootNavigator: true).pop(context);
                  },
                  child: Text("Ok", style: TextStyle(
                      color: Colors.black
                  ),
                  )
              ),
            ],
          )
      );
    }else if(isCheck == false){
      return showDialog(
          context: context,
          barrierDismissible: true,
          child: AlertDialog(
            title: new Text("Agree"
            ),
            content: Text("Agree to the terms and conditions."),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context,rootNavigator: true).pop(context);
                  },
                  child: Text("Ok", style: TextStyle(
                      color: Colors.black
                  ),
                  )
              ),
            ],
          )
      );
    }
    else
      {
        Navigator.push(context,MaterialPageRoute(builder: (context)=>
            first()
        ));
        }
  }


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.grey),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("CREATE YOUR PROFILE",
              style: TextStyle(
                color: Colors.black,
                fontSize: 45.0,
                fontWeight: FontWeight.bold,
              ),
              ),
              showImage(),
              InkWell(
                child: Text("Change",
                  style:TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline
                  )
                  ,),
                onTap: (){
                  _pickimagefromgalley(ImageSource.gallery);
                  // gallery
                },
              ),
              SizedBox(height: 19.0),
              Container(
                height: screenSize.height/4.6 ,
                width: screenSize.width/2.8 ,
                decoration: BoxDecoration(
                  color: Colors.white70
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      controller: username,
                      decoration: new InputDecoration(
                        labelText: "Username:",
                        fillColor:  Colors.white,
                          border: InputBorder.none
                      ),
                    ),
                    TextFormField(
                      controller: email,
                      decoration: new InputDecoration(
                        labelText: "Email:",
                        fillColor:  Colors.white,
                          border: InputBorder.none

                      ),
                    ),
                    TextFormField(
                      controller: password,
                      decoration: new InputDecoration(
                        labelText: "Password:",
                        fillColor:  Colors.white,
                          border: InputBorder.none

                      ),
                    ),
                    TextFormField(
                      controller: confirm_password,
                      decoration: new InputDecoration(
                        labelText: "Confirm Password:",
                        fillColor:  Colors.white,
                       border: InputBorder.none
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("TERMS AND CONDITIONS",
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Checkbox(value: isCheck,
                      onChanged: (value)
                      {
                        setState(()
                        {
                          isCheck = value;
                        });
                      }),
                  Text("Agree",style: TextStyle(color: Colors.black),)
                ],
              ),

        FlatButton.icon(onPressed: (){
          _conditions();
        },
           padding: EdgeInsets.only(left: 240,top: 40),
            icon: Icon(Icons.arrow_forward,size: 63,color: Colors.black,),
            label: Text(""))
            ],
          ),

        ),
      ),
    );
  }



}
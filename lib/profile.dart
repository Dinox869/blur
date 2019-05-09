import 'package:flutter/material.dart';
import 'package:blur/search.dart';
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
              Container(
                height: screenSize.height/4.6 ,
                width: screenSize.width/3.8 ,
                child: Column(
                  children: <Widget>[
                    Image.asset("assets/person.png",
                    fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
              InkWell(
                child: Text("Change",
                  style:TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline
                  )
                  ,),
                onTap: (){
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
//          RaisedButton.icon(
//              onPressed: ()
//              {
//                Navigator.push(context,MaterialPageRoute(builder: (context)=>
//                    search()
//                ));
//              },
//              color: Colors.blue,
//              icon: Icon(Icons.arrow_forward),
//              label: null)

              
            ],
          ),

        ),
      ),
    );
  }



}
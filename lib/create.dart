import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blur/firestoress.dart';

class clean extends StatefulWidget{
  @override
  cleans createState(){
    return cleans();
  }
}

class cleans extends State<clean> {

  final title = TextEditingController();
  final gift0 = TextEditingController(text: null);
  final gift1 = TextEditingController();
  final gift3 = TextEditingController();
  final gift2 = TextEditingController();
  final gift7 = TextEditingController();
  final gift4 = TextEditingController();
  final gift5 = TextEditingController();
  final gift6 = TextEditingController();
  final gif1 = TextEditingController();
  final gif3 = TextEditingController();
  final gif2 = TextEditingController();
  final gif7 = TextEditingController();
  final gif4 = TextEditingController();
  final gif5 = TextEditingController();
  final gif6 = TextEditingController();
  final gif0 = TextEditingController(text: null);

  List<String> _list = ['Private','Public'];
  String _selected_list;


  _showalert( TextEditingController gif){
    return showDialog (
        context: context,
        barrierDismissible: true,
        child: AlertDialog(
          title: new Text("Paste Link"
          ),
          content:  TextFormField(
             controller: gif,
              decoration: new InputDecoration(
                  hintText: "Paste here",
                  fillColor:  Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  )
              )
          ),
          actions: <Widget>[
            new FlatButton(
                onPressed: (){
                  Navigator.of(context,rootNavigator: true).pop(context);
                },
                child: Text("Cancel",style: TextStyle(
                    color: Colors.red
                ),
                )
            ),
            new FlatButton(
                onPressed: (){
                  Navigator.of(context,rootNavigator: true).pop(context);
                },
                child: Text("Save",style: TextStyle(
                    color: Colors.black
                ),
                )
            ),
          ],
        )
    );
  }
  _show(){
    return showDialog (
        context: context,
        barrierDismissible: true,
        child: AlertDialog(
          title: new Text("Error",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 18.0),
          ),
          content: Text("Incomplete form.Check the Add Link or the Text space."),
          actions: <Widget>[
            new FlatButton(
                onPressed: (){
                  Navigator.of(context,rootNavigator: true).pop(context);
                },
                child: Text("Cancel",style: TextStyle(
                    color: Colors.red
                ),
                )
            )
          ],
        )
    );
  }
  _showTime(){
    return showDialog (
        context: context,
        barrierDismissible: true,
        child: AlertDialog(
          title: new Text("Error",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 18.0),
          ),
          content: Text("Incomplete form.."),
          actions: <Widget>[
            new FlatButton(
                onPressed: (){
                  Navigator.of(context,rootNavigator: true).pop(context);
                },
                child: Text("Cancel",style: TextStyle(
                    color: Colors.red
                ),
                )
            )
          ],
        )
    );
  }
_sending(){
  final DocumentReference documentReference = Firestore.instance.collection("Dennis").document(title.text);
  //0
      if(gift0.text.length>0 && gif0.text.length>0 && gift1.text.length>0 && gif1.text.length>0 && gift2.text.length>0 && gif2.text.length>0 && gift3.text.length>0 && gif3.text.length>0 && gift4.text.length>0 && gif4.text.length>0 && gift5.text.length>0 && gif5.text.length>0 && gift6.text.length>0 && gif6.text.length>0 && gift7.text.length>0 && gif7.text.length>0 ) {
      Map<String,String> data = <String,String>{
        "item0": gift0.text,
        "link0": gif0.text,
        "item1": gift1.text,
        "link1": gif1.text,
        "item2": gift2.text,
        "link2": gif2.text,
        "item3": gift3.text,
        "link3": gif3.text,
        "item4": gift4.text,
        "link4": gif4.text,
        "item5": gift5.text,
        "link5": gif5.text,
        "item6": gift6.text,
        "link6": gif6.text,
        "item7": gift7.text,
        "link7": gif7.text
      };
      documentReference.setData(data).whenComplete(()async{
       await print("Document Added");
      }).catchError((e){
        print(e);
      });
      }
      else  if(gift0.text.length>0 && gif0.text.length>0 && gift1.text.length>0 && gif1.text.length>0 && gift2.text.length>0 && gif2.text.length>0 && gift3.text.length>0 && gif3.text.length>0 && gift4.text.length>0 && gif4.text.length>0 && gift5.text.length>0 && gif5.text.length>0 && gift6.text.length>0 && gif6.text.length>0 && gift7.text.length<0 && gif7.text.length<0 ) {
        Map<String,String> data = <String,String>{
          "item0": gift0.text,
          "link0": gif0.text,
          "item1": gift1.text,
          "link1": gif1.text,
          "item2": gift2.text,
          "link2": gif2.text,
          "item3": gift3.text,
          "link3": gif3.text,
          "item4": gift4.text,
          "link4": gif4.text,
          "item5": gift5.text,
          "link5": gif5.text,
          "item6": gift6.text,
          "link6": gif6.text,
        };
        documentReference.setData(data).whenComplete(()async{
          await print("Document Added");
        }).catchError((e){
          print(e);
        });
      }
      else  if(gift0.text.length>0 && gif0.text.length>0 && gift1.text.length>0 && gif1.text.length>0 && gift2.text.length>0 && gif2.text.length>0 && gift3.text.length>0 && gif3.text.length>0 && gift4.text.length>0 && gif4.text.length>0 && gift5.text.length>0 && gif5.text.length>0 && gift6.text.length<0 && gif6.text.length<0 && gift7.text.length<0 && gif7.text.length<0 ) {
        Map<String,String> data = <String,String>{
          "item0": gift0.text,
          "link0": gif0.text,
          "item1": gift1.text,
          "link1": gif1.text,
          "item2": gift2.text,
          "link2": gif2.text,
          "item3": gift3.text,
          "link3": gif3.text,
          "item4": gift4.text,
          "link4": gif4.text,
          "item5": gift5.text,
          "link5": gif5.text,
        };
        documentReference.setData(data).whenComplete(()async{
          await print("Document Added");
        }).catchError((e){
          print(e);
        });
      }
      else  if(gift0.text.length>0 && gif0.text.length>0 && gift1.text.length>0 && gif1.text.length>0 && gift2.text.length>0 && gif2.text.length>0 && gift3.text.length>0 && gif3.text.length>0 && gift4.text.length>0 && gif4.text.length>0 && gift5.text.length<0 && gif5.text.length<0 && gift6.text.length<0 && gif6.text.length<0 && gift7.text.length<0 && gif7.text.length<0 ) {
        Map<String,String> data = <String,String>{
          "item0": gift0.text,
          "link0": gif0.text,
          "item1": gift1.text,
          "link1": gif1.text,
          "item2": gift2.text,
          "link2": gif2.text,
          "item3": gift3.text,
          "link3": gif3.text,
          "item4": gift4.text,
          "link4": gif4.text,
        };
        documentReference.setData(data).whenComplete(()async{
          await print("Document Added");
        }).catchError((e){
          print(e);
        });
      }else  if(gift0.text.length>0 && gif0.text.length>0 && gift1.text.length>0 && gif1.text.length>0 && gift2.text.length>0 && gif2.text.length>0 && gift3.text.length>0 && gif3.text.length>0 && gift4.text.length<0 && gif4.text.length<0 && gift5.text.length<0 && gif5.text.length<0 && gift6.text.length<0 && gif6.text.length<0 && gift7.text.length<0 && gif7.text.length<0 ) {
        Map<String,String> data = <String,String>{
          "item0": gift0.text,
          "link0": gif0.text,
          "item1": gift1.text,
          "link1": gif1.text,
          "item2": gift2.text,
          "link2": gif2.text,
          "item3": gift3.text,
          "link3": gif3.text,
        };
        documentReference.setData(data).whenComplete(()async{
          await print("Document Added");
        }).catchError((e){
          print(e);
        });
      }
      else  if(gift0.text.length>0 && gif0.text.length>0 && gift1.text.length>0 && gif1.text.length>0 && gift2.text.length>0 && gif2.text.length>0 && gift3.text.length<0 && gif3.text.length<0 && gift4.text.length<0 && gif4.text.length<0 && gift5.text.length<0 && gif5.text.length<0 && gift6.text.length<0 && gif6.text.length<0 && gift7.text.length<0 && gif7.text.length<0 ) {
        Map<String,String> data = <String,String>{
          "item0": gift0.text,
          "link0": gif0.text,
          "item1": gift1.text,
          "link1": gif1.text,
          "item2": gift2.text,
          "link2": gif2.text
        };
        documentReference.setData(data).whenComplete(()async{
          await print("Document Added");
        }).catchError((e){
          print(e);
        });
      }
      else if(gift0.text.length>0 && gif0.text.length>0 && gift1.text.length>0 && gif1.text.length>0 && gift2.text.length<0 && gif2.text.length<0 && gift3.text.length<0 && gif3.text.length<0 && gift4.text.length<0 && gif4.text.length<0 && gift5.text.length<0 && gif5.text.length<0 && gift6.text.length<0 && gif6.text.length<0 && gift7.text.length<0 && gif7.text.length<0 ) {
        Map<String,String> data = <String,String>{
          "item0": gift0.text,
          "link0": gif0.text,
          "item1": gift1.text,
          "link1": gif1.text,
        };
        documentReference.setData(data).whenComplete(()async{
          await print("Document Added");
        }).catchError((e){
          print(e);
        });
      }
        else if(gift0.text.length>0 && gif0.text.length>0 && gift1.text.length<0 && gif1.text.length<0 && gift2.text.length<0 && gif2.text.length<0 && gift3.text.length<0 && gif3.text.length<0 && gift4.text.length<0 && gif4.text.length<0 && gift5.text.length<0 && gif5.text.length<0 && gift6.text.length<0 && gif6.text.length<0 && gift7.text.length<0 && gif7.text.length<0 ) {
          Map<String,String> data = <String,String>{
          "item0": gift0.text,
          "link0": gif0.text,
          };
          documentReference.setData(data).whenComplete(()async{
          await print("Document Added");
          }).catchError((e){
          print(e);
          });
          }
      else if( gift0.text.length>0 && gif0.text.length<=0 || gif0.text.length>0 && gift0.text.length<=0 )
      {
          _show();
      }
      else if( gift1.text.length>0 && gif1.text.length<=0 || gif1.text.length>0 && gift1.text.length<=0 )
      {
        _show();
      }
      else if( gift2.text.length>0 && gif2.text.length<=0 || gif2.text.length>0 && gift2.text.length<=0 )
      {

        _show();
      }
      else if( gift3.text.length>0 && gif3.text.length<=0 || gif3.text.length>0 && gift3.text.length<=0 )
      {
        _show();
      }
      else if( gift4.text.length>0 && gif4.text.length<=0 || gif4.text.length>0 && gift4.text.length<=0 )
      {
        _show();
      }
      else if( gift5.text.length>0 && gif5.text.length<=0 || gif5.text.length>0 && gift5.text.length<=0 )
      {
        _show();
      }
      else if( gift6.text.length>0 && gif6.text.length<=0 || gif6.text.length>0 && gift6.text.length<=0 )
      {
        _show();
      }
      else if( gift7.text.length>0 && gif7.text.length<=0 || gif7.text.length>0 && gift7.text.length<=0 )
      {
        _show();
      }
      else
      {
        _showTime();
      }

}
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
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.add),
                      onPressed: (){
//                        return new  Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: <Widget>[
//                            Text("SHARE WITH:", style:
//                            TextStyle(
//                                color: Colors.black,
//                                fontWeight: FontWeight.bold,
//                                fontSize: 18
//                            ),
//                            ),
//                            SizedBox(width: 25,),
//                            Flexible(
//                                child: DropdownButton(
//                                  items: _list.map((list){
//                                    return DropdownMenuItem(child: new Text(list,
//                                      style:
//                                      TextStyle(
//                                          color: Colors.black,
//                                          fontWeight: FontWeight.bold,
//                                          fontSize: 16
//                                      ),
//                                    ),
//                                      value: list,
//                                    );
//                                  }).toList(),
//                                  onChanged: (newValue){
//                                    setState(() {
//                                      _selected_list = newValue;
//                                    });
//                                  },
//                                  hint: Text('Public'),
//                                  value: _selected_list,
//                                )
//                            )
//                          ],
//                        );
                      })
                ],
                flexibleSpace: FlexibleSpaceBar(
                  title: Text("CREATE YOUR WISHLIST", style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0
                  ),
                  ),
                  centerTitle: true,
                  background: LayoutBuilder(builder: (context, constraint) {
                    return new Icon(
                        Icons.people, size: constraint.biggest.height);
                  }),
                ),
              ),

            ];
          },
          body: GestureDetector(
              onTap:(){
                FocusScope.of(context).requestFocus(new FocusNode());
              } ,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(left: 150,right: 150,top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Title: ", style:
                      TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                      ),
                      Flexible(
                          child:  TextFormField(
                            controller: title,
                            decoration: new InputDecoration(
                              hintText: "Wishlist title: e.g Birthday",
                              fillColor:  Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                  SizedBox(height: 30.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("SHARE WITH:", style:
                      TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                      ),
                      SizedBox(width: 25,),
                      Flexible(
                          child: DropdownButton(
                            items: _list.map((list){
                              return DropdownMenuItem(child: new Text(list,
                                style:
                                TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                              ),
                                value: list,
                              );
                            }).toList(),
                            onChanged: (newValue){
                              setState(() {
                                _selected_list = newValue;
                              });
                            },
                            hint: Text('Public'),
                            value: _selected_list,
                          )
                      )
                    ],
                  ),
                SizedBox(height: 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: TextFormField( controller: gift0,
                            decoration: new InputDecoration(
                              hintText: "Enter gift",
                              fillColor:  Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),)
                      ),
                      FlatButton(onPressed: (){
                        _showalert(gif0);
                      }, child: Text("Add Link",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 15
                      ),
                      ))
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: TextFormField( controller: gift1,
                            decoration: new InputDecoration(
                              hintText: "Enter gift",
                              fillColor:  Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),)
                      ),
                      FlatButton(onPressed: (){
                        _showalert(gif1);
                      }, child: Text("Add Link",
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 15
                        ),
                      ))
                    ],
                  ), SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: TextFormField( controller: gift2,
                            decoration: new InputDecoration(
                              hintText: "Enter gift",
                              fillColor:  Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),)
                      ),
                      FlatButton(onPressed: (){
                        _showalert(gif2);
                      }, child: Text("Add Link",
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 15
                        ),
                      ))
                    ],
                  ), SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: TextFormField( controller: gift3,
                            decoration: new InputDecoration(
                              hintText: "Enter gift",
                              fillColor:  Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),)
                      ),
                      FlatButton(onPressed: (){
                        _showalert(gif3);
                      }, child: Text("Add Link",
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 15
                        ),
                      ))
                    ],
                  ), SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: TextFormField( controller: gift4,
                            decoration: new InputDecoration(
                              hintText: "Enter gift",
                              fillColor:  Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),)
                      ),
                      FlatButton(onPressed: (){
                        _showalert(gif4);
                      }, child: Text("Add Link",
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 15
                        ),
                      ))
                    ],
                  ), SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: TextFormField( controller: gift5,
                            decoration: new InputDecoration(
                              hintText: "Enter gift",
                              fillColor:  Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),)
                      ),
                      FlatButton(onPressed: (){
                        _showalert(gif5);
                      }, child: Text("Add Link",
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 15
                        ),
                      ))
                    ],
                  ), SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: TextFormField( controller: gift6,
                            decoration: new InputDecoration(
                              hintText: "Enter gift",
                              fillColor:  Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),)
                      ),
                      FlatButton(onPressed: (){
                        _showalert(gif6);
                      }, child: Text("Add Link",
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 15
                        ),
                      ))
                    ],
                  ), SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: TextFormField( controller: gift7,
                            decoration: new InputDecoration(
                              hintText: "Enter gift",
                              fillColor:  Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),)
                      ),
                      FlatButton(onPressed: (){
                        _showalert(gif7);
                      }, child: Text("Add Link",
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 15
                        ),
                      ))
                    ],
                  ),
                  SizedBox(height: 20),
                  FlatButton(onPressed: (){
                   _sending();
                   //notification to say data is saved.
                  }, child: Text("SAVE WISHLIST",
                  style: TextStyle(color: Colors.blue,
                  fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                  )
                  )
                ],
              ),
            ),
          ),
        ));
  }
}


import 'package:flutter/material.dart';

class clean extends StatefulWidget{
  @override
  cleans createState(){
    return cleans();
  }
}

class cleans extends State<clean> {
  final title = TextEditingController();
  final gift1 = TextEditingController();
  List<String> _list = ['Private','Public'];
  String _selected_list;
  int count = 6;

  _showalert(){
    return showDialog (
        context: context,
        barrierDismissible: true,
        child: AlertDialog(
          title: new Text("Paste Link"
          ),
          content:  TextFormField(
            //   controller: title,
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
              )
            ];
          },
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
            child: Container(
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
                        _showalert();
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
                        _showalert();
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
                        _showalert();
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
                        _showalert();
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
                        _showalert();
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
                        _showalert();
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
                        _showalert();
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
                        _showalert();
                      }, child: Text("Add Link",
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 15
                        ),
                      ))
                    ],
                  )

                ],
              ),
            ),
          ),
        ));
  }
}

// Widget _buildList(TextEditingController title,BuildContext context){
//  return Row(
//    children: <Widget>[
//      Expanded(
//          child: ListTile(
//        title: TextFormField(
//    controller: title,
//    decoration: new InputDecoration(
//        hintText: "Enter gift",
//        fillColor:  Colors.white,
//        border: new OutlineInputBorder(
//          borderRadius: new BorderRadius.circular(25.0),
//          borderSide: new BorderSide(),
//        )
//          )
//            ),
//            trailing: _showAlert(context),
//              )
//                )
//    ],
//  );
//}
//_showAlert()
//{
//  return showDialog (
//      context: context,
//      barrierDismissible: true,
//      child: AlertDialog(
//        title: new Text("Paste Link"
//        ),
//        content:  TextFormField(
//         //   controller: title,
//            decoration: new InputDecoration(
//                hintText: "Paste here",
//                fillColor:  Colors.white,
//                border: new OutlineInputBorder(
//                  borderRadius: new BorderRadius.circular(25.0),
//                  borderSide: new BorderSide(),
//                )
//            )
//        ),
//        actions: <Widget>[
//          new FlatButton(
//              onPressed: (){
//                Navigator.of(context,rootNavigator: true).pop(context);
//              },
//              child: Text("Cancel",style: TextStyle(
//                  color: Colors.red
//              ),
//              )
//          ),
//          new FlatButton(
//              onPressed: (){
//               //
//              },
//              child: Text("Save",style: TextStyle(
//                  color: Colors.black
//              ),
//              )
//          ),
//        ],
//      )
//  );
//}
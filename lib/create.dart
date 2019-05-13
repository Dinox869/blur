import 'package:flutter/material.dart';

class clean extends StatefulWidget{
  @override
  cleans createState(){
    return cleans();
  }
}

class cleans extends State<clean> {
  final title = TextEditingController();
  List<String> _list = ['Private','Public'];
  String _selected_list;

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
          body: Center(
            child: Container(

              padding: EdgeInsets.only(left: 150,right: 150,top: 40 ),
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
                ],

              ),
            ),
          ),
        ));
  }
}

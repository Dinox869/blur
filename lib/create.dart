import 'package:flutter/material.dart';

class clean extends StatefulWidget{
  @override
  cleans createState(){
    return cleans();
  }
}

class cleans extends State<clean>{
  final title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled)
    {
      return <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          floating: false,
          pinned: false,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("CREATE YOUR FIRST WISHLIST",style: TextStyle(
                color: Colors.black,
                fontSize: 16.0
            ),
            ),
            centerTitle: true,
            background: LayoutBuilder(builder: (context,constraint){
              return new Icon(Icons.people,size: constraint.biggest.height);
            }),
          ),
        )
      ];
    },
      body:Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Title: ",style:
                    TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    )
                    ,),
                  TextFormField(

                  )

                ],
              )

            ],

          ),
        ),
      )


          ,
        ));
}






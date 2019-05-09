import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class third extends StatefulWidget
{
  @override
  thirds createState() {

    return thirds();
  }
}

class thirds extends State<third>
{
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("Dennis").snapshots(),
      builder: (BuildContext context,
      AsyncSnapshot<QuerySnapshot> snapshot)
        {

        }
    );
  }

}
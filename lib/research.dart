import 'package:flutter/material.dart';
import 'package:blur/create.dart';
import 'package:blur/profile.dart';
import 'package:blur/first.dart';
import 'package:blur/settings.dart';
import 'package:blur/icon_profile.dart';

class research extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<research> {
  final int _pageCount = 4;
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _body() {
    return Stack(
        children: List<Widget>.generate(_pageCount, (int index) {
      return IgnorePointer(
        ignoring: index != _pageIndex,
        child: Opacity(
          opacity: _pageIndex == index ? 1.0 : 0.0,
          child: Navigator(
            onGenerateRoute: (RouteSettings settings) {
              return new MaterialPageRoute(
                builder: (_) => _page(index),
                settings: settings,
              );
            },
          ),
        ),
      );
    }),
    );
  }

  Widget _page(int index) {
    switch (index) {
      case 0:
        return first();
      case 1:
        return profile();
      case 2:
        return clean();
      case 3:
        return icon_profile();
    }

    throw "Invalid index $index";
  }

  BottomNavigationBar _bottomNavigationBar() {
    final theme = Theme.of(context);
    return new BottomNavigationBar(
     unselectedItemColor: Colors.lime,
      fixedColor: theme.primaryColor,
      currentIndex: _pageIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          title: Text("Page 1"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text("Page 2"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Page 3"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text("Page 4"),
        ),
      ],
      onTap: (int index) {
        setState(() {
          _pageIndex = index;
        });
      },
    );
  }
}
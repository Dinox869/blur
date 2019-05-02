import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async
{
  await SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.grey,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.grey,
    systemNavigationBarIconBrightness: Brightness.dark
  ));
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new MyApp());
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blur',
      theme: ThemeData(
        primaryColorLight: Colors.grey,
        primaryColorBrightness: Brightness.light
      ),
    home: MyHomePage(),
    ) ;
  }
}

class MyHomePage extends StatefulWidget
{
  @override
  _MyHomePage createState() => _MyHomePage();

}
 class _MyHomePage extends State<MyHomePage> with SingleTickerProviderStateMixin
 {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

 }





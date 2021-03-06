import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home' ,
      routes:{
        'home': (BuildContext context) => new HomePage(),
      } ,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.deepPurple
      ),
    );
  }
}
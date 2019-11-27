import 'package:flutter/material.dart';
import 'package:instagram_song/constants/material_white_color.dart';
import 'package:instagram_song/main_page.dart';


void main(){
  return runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MainPage(),
      theme: ThemeData(
        primarySwatch: white
      ),
    );
  }
}




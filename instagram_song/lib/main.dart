import 'package:flutter/material.dart';
import 'package:instagram_song/constants/material_white_color.dart';
import 'package:instagram_song/main_page.dart';
import 'package:instagram_song/screens/auth_page.dart';
import 'package:instagram_song/screens/signin_page.dart';


void main(){
  return runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:AuthPage(),
      theme: ThemeData(
        primarySwatch: white
      ),
    );
  }
}




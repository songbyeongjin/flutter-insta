import 'package:flutter/material.dart';
import 'package:instagram_song/constants/size.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _menuopened = false;
  Size _size;
  double menuWidth;
  int duration = 200;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size; //get size of display
    menuWidth = _size.width / 1.5;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _sideMenu(),
          _profile(),
        ],
      ),
    );
  }

  Widget _sideMenu() {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      color: Colors.grey[200],
      duration: Duration(milliseconds: duration),
      transform: Matrix4.translationValues(
        _menuopened ? (_size.width - menuWidth) : _size.width,
        0,
        0,
      ),
    );
  }

  Widget _profile() {
    return AnimatedContainer(
      duration: Duration(milliseconds: duration),
      curve: Curves.easeInOut,
      color: Colors.transparent,
      transform: Matrix4.translationValues(
        _menuopened ? -menuWidth : 0,
        0,
        0,
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child:Padding(
                  padding: const EdgeInsets.only(left:COMMON_GAP),
                  child: Text('sondol zzang', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21),),
                )),
                IconButton(icon:Icon(Icons.menu),onPressed: (){
                  setState(() {
                    _menuopened = !_menuopened;
                  });
                },)
              ],
            )
          ],
        ),
      ),
    );
  }
}

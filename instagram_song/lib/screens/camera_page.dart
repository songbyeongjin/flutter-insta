import 'package:flutter/material.dart';

class Camerapage extends StatefulWidget {
  @override
  _CamerapageState createState() => _CamerapageState();
}

class _CamerapageState extends State<Camerapage> {

  int _selectedIndex = 1;
  var _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Photo",
          style:TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: (){
              Navigator.pop(context);
            }),
        ],
      ),
      body:PageView(
        controller: _pageController,
        onPageChanged: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          _galleyPage(),
          _takePhotoPage(),
          _takeVideoPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[50],
        items:const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/grid.png")),
            title: Text("Galley"),//not displayed so what icon is Ok
          ),BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/grid.png")),
            title: Text("Photo"),//not displayed so what icon is Ok
          ),BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/grid.png")),
            title: Text("VIDEO"),//not displayed so what icon is Ok
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index)
  {
    _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  Widget _galleyPage(){
    return Container(color : Colors.green);
  }

  Widget _takePhotoPage(){
    return Container(color : Colors.purple);
  }

  Widget _takeVideoPage(){
    return Container(color : Colors.deepOrange);
  }
}


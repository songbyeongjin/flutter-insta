import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_song/constants/size.dart';
import 'package:instagram_song/utils/profile_img_path.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _menuopened = false;
  double menuWidth;
  int duration = 200;
  AlignmentGeometry tabAlign = Alignment.centerLeft;
  double _gridMargin = 0;
  double _myImgGridMargin = size.width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size; //get size of display
    menuWidth = size.width / 1.5;

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
      width: menuWidth,
      curve: Curves.easeInOut,
      color: Colors.grey[200],
      duration: Duration(milliseconds: duration),
      transform: Matrix4.translationValues(
        _menuopened ? (size.width - menuWidth) : size.width,
        0,
        0,
      ),
      child: SafeArea(
        child: SizedBox(
          width: menuWidth,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FlatButton(
                  child: Text('songdol'),
                  onPressed: null,
                )
              ]),
        ),
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
            _usernameIconButton(),
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                      delegate: SliverChildListDelegate([
                    _getProfileHeader,
                    _username(),
                    _userBio(),
                    _editProfileButton(),
                    _getTabIconButtons,
                    _getAnimatedSelectedBar,
                  ])),
                  _getImageGrid(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _getImageGrid(BuildContext context) => SliverToBoxAdapter(
          child: Stack(children: <Widget>[
        AnimatedContainer(
          transform: Matrix4.translationValues(_gridMargin, 0, 0),
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 200),
          child:_imageGrid,

        ),
        AnimatedContainer(
          transform: Matrix4.translationValues(_myImgGridMargin, 0, 0),
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 200),
          child:_imageGrid,
        )
      ]));


  GridView get _imageGrid => GridView.count(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    crossAxisCount: 3,
    childAspectRatio: 1,
    children:List.generate(30, (index) => _gridImgItem(index))
  );

  CachedNetworkImage _gridImgItem(int index) => CachedNetworkImage(
    fit:BoxFit.cover,
    imageUrl:"https://picsum.photos/id/$index/100/100");

  Padding _editProfileButton() {
    return Padding(
      padding: const EdgeInsets.all(COMMON_GAP),
      child: OutlineButton(
        onPressed: () {},
        borderSide: BorderSide(color: Colors.black45),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: Text(
          'Edit Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Padding _userBio() {
    return Padding(
      padding: const EdgeInsets.only(left: COMMON_GAP),
      child: Text('Bio from User. So say Something',
          style: TextStyle(fontWeight: FontWeight.w400)),
    );
  }

  Padding _username() {
    return Padding(
      padding: const EdgeInsets.only(left: COMMON_GAP),
      child:
          Text('User Real Name', style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Row get _getProfileHeader => Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(COMMON_GAP),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(getProfileImgPath("songdol")),
            ),
          ),
          Expanded(
            child: Table(children: [
              TableRow(children: [
                _getStatusValueWidget("123"),
                _getStatusValueWidget("324"),
                _getStatusValueWidget("112"),
              ]),
              TableRow(children: [
                _getStatusLabelWidget("Posts"),
                _getStatusLabelWidget("Followers"),
                _getStatusLabelWidget("Following"),
              ]),
            ]),
          )
        ],
      );

  Widget _getStatusValueWidget(String value) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: COMMON_GAP),
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ),
      );

  Widget _getStatusLabelWidget(String value) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: COMMON_GAP),
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500),
              )),
        ),
      );

  Row _usernameIconButton() {
    return Row(
      children: <Widget>[
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: COMMON_GAP),
          child: Text(
            'songdol',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
        )),
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            setState(() {
              _menuopened = !_menuopened;
            });
          },
        )
      ],
    );
  }

  Widget get _getTabIconButtons => Row(children: <Widget>[
        Expanded(
            child: IconButton(
                icon: ImageIcon(AssetImage("assets/grid.png")),
                onPressed: () {
                  _setTab(true);
                })),
        Expanded(
            child: IconButton(
          icon: ImageIcon(AssetImage("assets/saved.png")),
          onPressed: () {
            _setTab(false);
          },
        ))
      ]);

  Widget get _getAnimatedSelectedBar => AnimatedContainer(
        alignment: tabAlign,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        color: Colors.transparent,
        height: 1,
        width: size.width,
        child: Container(
          height: 1,
          width: size.width / 2,
          color: Colors.black87,
        ),
      );

  _setTab(bool tabLeft) {
    setState(() {
      if (tabLeft) {
        this.tabAlign = Alignment.centerLeft;
        this._gridMargin = 0;
        this._myImgGridMargin = size.width;
      } else {
        this.tabAlign = Alignment.centerRight;
        this._gridMargin = -size.width;
        this._myImgGridMargin = 0;
      }
    });
  }
}

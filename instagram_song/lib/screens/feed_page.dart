import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_song/constants/size.dart';
import 'package:instagram_song/utils/profile_img_path.dart';
import 'package:instagram_song/widgets/comment.dart';
import 'package:instagram_song/widgets/my_progress_indicator.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: null,
            icon: ImageIcon(AssetImage('assets/direct_message.png'),
                color: Colors.black)),
        title: Image.asset(
          'assets/insta_text_logo.png',
          height: 23,
        ),
        actions: <Widget>[
          IconButton(
              onPressed: null,
              icon: ImageIcon(AssetImage('assets/actionbar_camera.png'),
                  color: Colors.black)),
          IconButton(
              onPressed: null,
              icon: ImageIcon(AssetImage('assets/direct_message.png'),
                  color: Colors.black)),
        ],
      ),
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return _postItem(index, context);
          }),
    );
  }

  Column _postItem(int index, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _postHeader('username $index'),
        _postImage(index),
        _postActions(),
        _postLikes(),
        _postCaption(context, index),
        _allCommentButton()
      ],
    );
  }

  FlatButton _allCommentButton() {
    return FlatButton(
          onPressed: null,
          child: Text('show all 18 comment', style: TextStyle(color:Colors.grey[600]),)
      );
  }

  Padding _postCaption(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: COMMON_GAP, vertical: COMMON_GAP),
      child: Comment(
          username: 'username $index', caption: 'abvcabvcabvcabvcabvcabvc'),
    );
  }

  Padding _postLikes() {
    return Padding(
      padding: const EdgeInsets.only(left: COMMON_GAP),
      child: Text('80 likes', style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Row _postActions() {
    return Row(children: <Widget>[
      IconButton(
        icon: ImageIcon(
          AssetImage('assets/heart_selected.png'),
          color: Colors.redAccent,
        ),
        onPressed: null,
      ),
      IconButton(
        icon: ImageIcon(
          AssetImage('assets/comment.png'),
          color: Colors.black87,
        ),
        onPressed: null,
      ),
      IconButton(
        icon: ImageIcon(
          AssetImage('assets/direct_message.png'),
          color: Colors.black87,
        ),
        onPressed: null,
      ),
      Spacer(),
      IconButton(
        icon: ImageIcon(
          AssetImage('assets/bookmark.png'),
          color: Colors.black87,
        ),
        onPressed: null,
      ),
    ]);
  }

  Row _postHeader(String username) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(COMMON_GAP),
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              getProfileImgPath(username),
            ),
            radius: PROFILE_RADIUS,
          ),
        ),
        Expanded(child: Text(username)),
        IconButton(
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black87,
          ),
          onPressed: null,
        )
      ],
    );
  }

  CachedNetworkImage _postImage(int index) {
    return CachedNetworkImage(
      imageUrl: 'https://picsum.photos/id/$index/200/200',
      placeholder: (context ,url){
        return MyProgressIndicator();
      },
      imageBuilder: (BuildContext context, ImageProvider imageProvider) =>
          AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          )),
        ),
      ),
    );
  }
}


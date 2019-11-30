import 'package:flutter/material.dart';
import 'package:instagram_song/constants/size.dart';
import 'package:instagram_song/utils/profile_img_path.dart';


class Comment extends StatelessWidget {
  final String username;
  final bool showProfile;
  final DateTime dateTime;
  final String caption;

  const Comment({Key key, @required this.username, this.showProfile = false, this.dateTime, @required this.caption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Visibility(
          visible: showProfile,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              getProfileImgPath(username)
            ),
            radius: PROFILE_RADIUS,
          ),
        ),
        Visibility(
          visible: showProfile,
            child: SizedBox(width:COMMON_XS_GAP,)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              RichText(
                text:TextSpan(
                    style:DefaultTextStyle.of(context).style,
                    children:<TextSpan>[
                      TextSpan(
                          text: username,
                          style:TextStyle(fontWeight: FontWeight.bold)
                      ),
                      TextSpan(
                          text:" "
                      ),
                      TextSpan(
                          text:'blah blahblah blahblah blahblah blahblah blahblah blahblah blahblah blah yeaaa!!!'
                      ),
                    ]
                ),
              ),
              SizedBox(height: COMMON_XS_GAP,),
              Visibility(
                visible: dateTime != null,
                  child: dateTime != null ? Text(dateTime.toIso8601String(), style: TextStyle(color: Colors.grey[700], fontSize: 11),) : SizedBox()),
            ]
          ),
        )
      ],
    );
  }
}

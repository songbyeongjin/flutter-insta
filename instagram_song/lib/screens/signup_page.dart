import 'package:flutter/material.dart';
import 'package:instagram_song/screens/signin_page.dart';
import 'package:instagram_song/widgets/sign_in_form.dart';
import 'package:instagram_song/widgets/sign_up_form.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:Stack(
            children: <Widget>[
              SignUpForm(),
              _goToSignUpPageBtn(context),
            ],
          )
      ),
    );
  }
}


Positioned _goToSignUpPageBtn(BuildContext context){
  return Positioned(
      left:0,
      right: 0,
      bottom: 0,
      height: 40,
      child:FlatButton(
        shape: Border(top:BorderSide(color: Colors.grey[300])),
        onPressed: (){
          final route = MaterialPageRoute(builder: (context) => SignInPage());
          Navigator.pushReplacement(context, route);
        },
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(),
            children: <TextSpan>[
              TextSpan(
                  text: "Already have an account?",
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color:Colors.black54)),
              TextSpan(
                  text: "Sign In",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color:Colors.blue[600])),
            ],
          ),
        ),
      )
  );
}
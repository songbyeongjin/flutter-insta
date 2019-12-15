import 'package:flutter/material.dart';
import 'package:instagram_song/constants/size.dart';
import 'package:instagram_song/main_page.dart';
import 'package:instagram_song/utils/simple_snack_bar.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}


class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _cpwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(COMMON_GAP),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Spacer(
                flex: 6,
              ),
              Image.asset("assets/insta_text_logo.png"),
              Spacer(
                flex: 1,
              ),
              TextFormField(
                controller: _emailController,
                decoration: getTextFieldDecor('Email'),
                validator:(String value){
                  if(value.isEmpty || !value.contains("@")){
                    return 'Please enter your email address!';
                  }
                  return null;
                },
              ),
              Spacer(
                flex: 1,
              ),
              TextFormField(
                controller: _pwController,
                decoration: getTextFieldDecor('PassWord'),
                validator: (String value){
                  if(value.isEmpty){
                    return 'Please enter any Password!';
                  }
                  return null;
                },
              ),
              Spacer(
                flex: 1,
              ),
              TextFormField(
                controller: _cpwController,
                decoration: getTextFieldDecor('Confirm PassWord'),
                validator: (String value){
                  if(value.isEmpty || value != _pwController.value.text){
                    return 'Password does not match!';
                  }
                  return null;
                },
              ),
              Spacer(
                flex: 2,
              ),
              FlatButton(
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    final route = MaterialPageRoute(builder: (context)=>MainPage());
                    Navigator.pushReplacement(context, route);
                  }
                },
                child:Text(
                  "Join",
                  style:TextStyle(color: Colors.white),
                ),
                color:Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
                disabledColor: Colors.blue[100],
              ),
              Spacer(
                flex: 2,
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    left: 0,
                    right: 0,
                    child:Container(
                      color:Colors.grey[300],
                      height: 1,
                    )),
                  Container(
                    height: 3,
                    width: 50,
                    color: Colors.grey[50],
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      color:Colors.grey,fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Spacer(
                flex: 2,
              ),
              FlatButton.icon(
                textColor: Colors.blue,
                  onPressed: (){
                  simpleSnackbar(context, "facebook pressed");
                  },
                  icon: ImageIcon(AssetImage("assets/icon/facebook.png")),
                  label: Text("Login with Facebook")),
              Spacer(
                flex: 6,
              ),
            ],
          )),
      ),
    );
  }


  InputDecoration getTextFieldDecor(String hint){
    return InputDecoration(
      hintText: hint,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[300],
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey[300],
        width: 1,
      ),
      borderRadius: BorderRadius.circular(12),
    )
    ,
    fillColor: Colors.grey[100],
    filled: true);
  }
}

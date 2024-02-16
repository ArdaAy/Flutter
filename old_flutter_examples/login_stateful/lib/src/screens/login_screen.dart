import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin{
  final formKey = GlobalKey<FormState>();

  String password = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(bottom: 25.0),),
            submitButton(),
          ],
        ),
      ),
    );
  }


  Widget emailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
        
      ),
      validator: validateEmail,
      onSaved: (String value){
        email = value;
      },
    );
  }

  Widget passwordField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
      ),
      validator: validatePassword,
      // ValiadtionMixin class'ını implement edip 
      // with ile bu class'a bağlayınca
      // içindeki metodu () kullanmadan yazdık
      onSaved: (String value){
        password = value;
      },
    );
  }

  Widget submitButton(){
    return RaisedButton(
      child: Text('Submit'),
      onPressed: () {
        //formları reset etmek için
        //formKey.currentState.reset();
        if (formKey.currentState.validate()){
          formKey.currentState.save();
          print('Time to send $email and $password');

        }
      },
      color: Colors.blue,
    );
  }
}
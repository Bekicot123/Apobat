import 'package:apobat/Component/NavBar.dart';
import 'package:apobat/Component/Splash%20screen.dart';
import 'package:apobat/Page/Landing_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:apobat/Page/Home_Page.dart';
import 'package:apobat/Page/LoginOrRegister_Page.dart';
import 'package:apobat/Page/Login_Page.dart';

class AuthPage extends StatelessWidget{
  static const routeName = '/auth';
  const AuthPage({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Navbar();
          }
          else{
            return LoginOrRegister();
          }
        },
      ),
    );
  }
}
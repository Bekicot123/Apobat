import 'dart:async';

import 'package:apobat/Page/LoginOrRegister_Page.dart';
import 'package:flutter/material.dart';

class Splashview extends StatefulWidget{
  Splashview({Key? key}): super(key: key);

  @override
  State<Splashview> createState() => _SplashviewState();
  
}

class _SplashviewState extends State<Splashview>{
@override
  void initState() {
  Timer(Duration(seconds: 2), () {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>LoginOrRegister()), (route) => false);
  });


    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('lib/Image/logo.png'),
      ),
    );
  }
  
}
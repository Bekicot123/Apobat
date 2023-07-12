import 'package:apobat/Component/Splash%20screen.dart';
import 'package:apobat/List_Vitamin/DetailVitamin.dart';
import 'package:apobat/Page/Landing_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:apobat/Component/Splash screen.dart';
import 'package:flutter/material.dart';
import 'package:apobat/Component/auth.dart';
import 'package:apobat/Page/LoginOrRegister_Page.dart';
import 'package:apobat/Page/Register_Page.dart';
import 'package:apobat/firebase_options.dart';
import 'List_Flu/DetailFlu.dart';
import 'Page/Login_Page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AuthPage.routeName,
      routes: {
        AuthPage.routeName: (context) => const AuthPage(),
        Landing_Page.routeName: (context) => Landing_Page(),
        DetailFlu.routeName : (context) => DetailFlu(id: ModalRoute.of(context)?.settings.arguments.toString()?? ''),
        DetailVitamin.routeName : (context) => DetailVitamin(id: ModalRoute.of(context)?.settings.arguments.toString()?? ''),
      },
    );
  }
}
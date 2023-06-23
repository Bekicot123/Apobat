import 'package:apobat/Page/Cart_Page.dart';
import 'package:apobat/Page/Home_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:apobat/Page/Landing_Page.dart';

class AkunPage extends StatefulWidget {
  AkunPage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  State<AkunPage> createState() =>_AkunPageState();
}
class _AkunPageState extends State<AkunPage>{
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.email!),
        actions: [IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))],
      ),
    );
  }
}

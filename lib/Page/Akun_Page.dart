import 'package:apobat/Component/text_boxt.dart';
import 'package:apobat/Page/Cart_Page.dart';
import 'package:apobat/Page/Home_Page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:apobat/Page/Landing_Page.dart';

class AkunPage extends StatefulWidget {
  AkunPage({super.key});

  @override
  State<AkunPage> createState() =>_AkunPageState();
}
class _AkunPageState extends State<AkunPage>{
  //user
  final currentUser = FirebaseAuth.instance.currentUser!;

  //edit field
  Future<void> editField(String field) async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'P r o f i l e'
          ),
        ),
        //title: Text(user.email!),
      ),
      body: ListView(
              children: [
                const SizedBox(height: 50,),
                // profile pic
                const Icon(
                  Icons.person,
                  size: 72,
                  color: Colors.blue,
                ),
                const SizedBox(height: 10,),

                // user email
                Text(
                  currentUser.email!,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[700]),
                ),

                const SizedBox(height: 50,),

                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'My Details',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),

                // user fullname
                MyTextBox(
                  text: 'username',
                  sectionName: 'username',
                  onPressed: () => editField('username'),
                ),

                //user fullname
                MyTextBox(
                  text: 'fullname',
                  sectionName: 'fullname',
                  onPressed: () => editField('fullname'),
                ),

                // user address
                MyTextBox(
                  text: 'address',
                  sectionName: 'address',
                  onPressed: () => editField('address'),
                ),
              ],
            ),

    );
  }
}

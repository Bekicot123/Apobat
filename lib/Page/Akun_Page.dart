import 'package:apobat/Component/text_boxt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key});

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection("Users");

  //edit field
  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.blue[200],
        title: Text(
          "Edit $field",
          style: const TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: const TextStyle(color: Colors.black),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          //cancel button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
          ),

          //save button
          TextButton(
            onPressed: () => Navigator.of(context).pop(newValue),
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );

    if (newValue.trim().isNotEmpty) {
      await usersCollection.doc(currentUser.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Profile'),
        ),
        //title: Text(user.email!),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(currentUser.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text('No data available'),
            );
          }

          final userData = snapshot.data!.data() as Map<String, dynamic>?;

          if (userData == null) {
            return const Center(
              child: Text('No user data found'),
            );
          }

          return ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              // profile pic
              const Icon(
                Icons.person,
                size: 72,
                color: Color.fromARGB(255, 12, 126, 69),
              ),
              const SizedBox(
                height: 10,
              ),

              // user email
              Text(
                currentUser.email!,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700]),
              ),

              const SizedBox(
                height: 50,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  'My Details',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),

              // username
              MyTextBox(
                text: userData['username'] ?? 'No username',
                sectionName: 'username',
                onPressed: () => editField('username'),
              ),

              // user fullname
              MyTextBox(
                text: userData['fullname'] ?? 'No fullname',
                sectionName: 'fullname',
                onPressed: () => editField('fullname'),
              ),

              // user address
              MyTextBox(
                text: userData['address'] ?? 'No address',
                sectionName: 'address',
                onPressed: () => editField('address'),
              ),
            ],
          );
        },
      ),
    );
  }
}

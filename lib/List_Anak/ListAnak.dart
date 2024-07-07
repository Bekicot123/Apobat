import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'CardAnak.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const AnakList());
}

class AnakList extends StatefulWidget {
  static const routeName = '/AnakList';
  const AnakList({super.key});

  @override
  State<AnakList> createState() => _AnakListState();
}

class _AnakListState extends State<AnakList> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference _anak =
      FirebaseFirestore.instance.collection("Anak");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Anak'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 700,
                child: StreamBuilder(
                    stream: _anak.snapshots(),
                    builder: (context, AsyncSnapshot snapshots) {
                      if (snapshots.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        );
                      }
                      if (snapshots.hasData) {
                        return ListView.builder(
                            itemCount: snapshots.data?.docs.length,
                            itemBuilder: (context, index) {
                              log('Index : $index');
                              QueryDocumentSnapshot<Object?>? ds =
                                  snapshots.data?.docs[index];
                              log('Index : $ds');
                              return CardAnak(ds?.id);
                            });
                      } else {}
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

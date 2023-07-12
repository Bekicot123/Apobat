import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:apobat/List_Flu/CardFlu.dart';

import 'CardBatuk.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const BatukList());
}
class BatukList extends StatefulWidget {
  static const routeName = '/BatukList';
  const BatukList({super.key});

  @override
  State<BatukList> createState() => _BatukListState();
}

class _BatukListState extends State<BatukList> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference _batuk =
  FirebaseFirestore.instance.collection("Batuk");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Batuk'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 700,
                child: StreamBuilder(
                    stream: _batuk.snapshots(),
                    builder: (context, AsyncSnapshot snapshots){
                      if (snapshots.connectionState == ConnectionState.waiting){
                        return Center(
                          child: CircularProgressIndicator(color: Colors.green,),
                        );
                      }
                      if (snapshots.hasData){
                        return ListView.builder(
                            itemCount: snapshots.data?.docs.length,
                            itemBuilder: (context, index){
                              log('Index : $index');
                              QueryDocumentSnapshot<Object?>? ds =
                              snapshots.data?.docs[index];
                              log('Index : $ds');
                              return CardBatuk(ds?.id);
                            });
                      }else{}
                      return Center(
                        child: CircularProgressIndicator(color: Colors.red,),
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

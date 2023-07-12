import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:apobat/List_Flu/CardFlu.dart';

import 'CardDemam.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const DemamList());
}
class DemamList extends StatefulWidget {
  static const routeName = '/DemamList';
  const DemamList({super.key});

  @override
  State<DemamList> createState() => _DemamListState();
}

class _DemamListState extends State<DemamList> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference _Demam =
  FirebaseFirestore.instance.collection("Demam");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List DEMAM'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 700,
                child: StreamBuilder(
                    stream: _Demam.snapshots(),
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
                              return CardDemam(ds?.id);
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

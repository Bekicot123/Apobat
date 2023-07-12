import 'dart:developer';
import 'package:apobat/List_Vitamin/CardVitamin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:apobat/List_Flu/CardFlu.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const VitaminList());
}
class VitaminList extends StatefulWidget {
  static const routeName = '/VitaminList';
  const VitaminList({super.key});

  @override
  State<VitaminList> createState() => _VitaminListState();
}

class _VitaminListState extends State<VitaminList> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference _Flu =
  FirebaseFirestore.instance.collection("Vitamin");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Obat FLU'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 700,
                child: StreamBuilder(
                    stream: _Flu.snapshots(),
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
                              return CardVitamin(ds?.id);
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

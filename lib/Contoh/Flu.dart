import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hosting/CRUD/CardFlu.dart';
import 'package:hosting/CRUD/addEditFlu.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const FluList());
}
class FluList extends StatefulWidget {
  static const routeName = '/Flu';
  const FluList({super.key});

  @override
  State<FluList> createState() => _FluListState();
}

class _FluListState extends State<FluList> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference _Flu = 
      FirebaseFirestore.instance.collection("Flu");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEditFlu()),
          );
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 500,
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
                              return CardFlu(ds?.id);
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

import 'package:apobat/Component/ButtonCart.dart';
import 'package:flutter/material.dart';
import 'package:apobat/Page/Akun_Page.dart';
import 'package:apobat/Page/Landing_Page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartPage extends StatefulWidget{
  CartPage ({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}
class _CartPageState extends State<CartPage>{

  final currentUser = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection("Users");

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Keranjang'),
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding:  EdgeInsets.all(24),
        height: 195,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)
          )
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Items',
                  style: TextStyle(fontSize: 16,fontStyle: FontStyle.normal,color: Colors.blueGrey),
                ),
                Text(
                  '-',
                  style: TextStyle(fontSize: 16,fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Harga',
                  style: TextStyle(fontSize: 16,fontStyle: FontStyle.normal,color: Colors.blueGrey),
                ),
                Text(
                  'IDR -,',
                  style: TextStyle(fontSize: 16,fontStyle: FontStyle.normal,fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            MyButtonCart(onTap: (){}, text: 'Check Out')
          ],
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection("Users").doc(currentUser.email).snapshots(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            final userData = snapshot.data!.data() as Map<String, dynamic>;

            return ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(24),
                  height: 166,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivery Destination",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(fontSize: 14,color: Colors.grey[700]),
                          ),
                          Text(
                            userData['fullname'],
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Address",
                            style: TextStyle(fontSize: 14,color: Colors.grey[700]),
                          ),
                          Text(
                            userData['address'],
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(24),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text(
                        'Oops!! No Product in Cart!',
                        style: TextStyle(fontSize: 17,fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100,),
                Container(
                  padding: EdgeInsets.all(24),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text(
                        'Pilih Metode Pembayaran',
                        style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic, fontWeight: FontWeight.bold,),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error' + snapshot.error.toString()),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
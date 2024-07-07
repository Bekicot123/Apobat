import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:apobat/Component/ButtonCart.dart';

class Detail_Product extends StatefulWidget {
  const Detail_Product({super.key});

  @override
  _Detail_ProductState createState() => _Detail_ProductState();
}

class _Detail_ProductState extends State<Detail_Product> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _addToCart() async {
    User? user = _auth.currentUser;

    if (user != null) {
      DocumentReference cartRef = _firestore.collection('Users').doc(user.email);

      await cartRef.update({
        'cart': FieldValue.arrayUnion([
          {
            'name': 'Decolgen Tablet',
            'price': 7000,
            'image': 'lib/Image/obatflu.png', // You should replace this with the actual image URL if available.
            'quantity': 1, // You can allow the user to specify quantity if needed.
          }
        ]),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              height: 70,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      size: 32,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text('Detail Obat',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal)),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              height: 200,
              color: Colors.white,
              child: Image.asset(
                'lib/Image/obatflu.png',
                width: 200,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Decolgen Tablet',
                    style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Decolgen Tablet merupakan obat dengan kandungan Paracetamol, Pseudoephedrine HCl, Chlorpheniramine maleate yang bekerja sebagai analgesik-antipiretik, antihistamin dan dekongestan hidung. Obat ini dapat digunakan untuk meredakan gejala flu seperti demam, sakit kepala, bersin-bersin, dan hidung tersumbat.',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Colors.grey),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  const Row(
                    children: [
                      Spacer(),
                      Text(
                        'Rp 7000',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  MyButtonCart(
                    onTap: _addToCart,
                    text: 'Tambah Keranjang',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

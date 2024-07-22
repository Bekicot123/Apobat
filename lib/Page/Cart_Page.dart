import 'package:apobat/Component/ButtonCart.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:apobat/Page/Payment_Page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection("Users");

  Future<void> _deleteCartItem(int index, List<dynamic> cartItems) async {
    cartItems.removeAt(index);

    await usersCollection.doc(currentUser.email).update({
      'cart': cartItems,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Keranjang'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(24),
        height: 195,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Items',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  '-',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Harga',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  'IDR -,',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            MyButtonCart(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                );
              },
              text: 'Check Out',
            ),
          ],
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: usersCollection.doc(currentUser.email).snapshots(),
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

          if (!snapshot.hasData || snapshot.data!.data() == null) {
            return const Center(
              child: Text('No data available'),
            );
          }

          final userData = snapshot.data!.data() as Map<String, dynamic>;
          final cartItems = userData['cart'] as List<dynamic>?;

          if (cartItems == null || cartItems.isEmpty) {
            return const Center(
              child: Text('Oops!! No Product in Cart!'),
            );
          }

          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index] as Map<String, dynamic>;
              return ListTile(
                leading: Image.network(item['image'] ??
                    'https://icon-library.com/images/no-image-icon/no-image-icon-0.jpg'),
                title: Text(item['name']),
                subtitle: Text('Rp ${item['price']}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Quantity: ${item['quantity']}'),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        await _deleteCartItem(index, cartItems);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Center(
        child: Text('This is the payment page'),
      ),
    );
  }
}

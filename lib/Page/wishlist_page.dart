import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection("Users");

  Future<void> _deleteWishlistItem(
      int index, List<dynamic> wishlistItems) async {
    wishlistItems.removeAt(index);

    await usersCollection.doc(currentUser.email).update({
      'wishlist': wishlistItems,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Wishlist'),
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
          final wishlistItems = userData['wishlist'] as List<dynamic>?;

          if (wishlistItems == null || wishlistItems.isEmpty) {
            return const Center(
              child: Text('Your wishlist is empty'),
            );
          }

          return ListView.builder(
            itemCount: wishlistItems.length,
            itemBuilder: (context, index) {
              final item = wishlistItems[index] as Map<String, dynamic>;
              return ListTile(
                leading: Image.network(item['image'] ??
                    'https://icon-library.com/images/no-image-icon/no-image-icon-0.jpg'),
                title: Text(item['name']),
                subtitle: Text('Rp ${item['price']}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await _deleteWishlistItem(index, wishlistItems);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

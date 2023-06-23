import 'package:flutter/material.dart';
import 'package:apobat/Page/Akun_Page.dart';
import 'package:apobat/Page/Landing_Page.dart';

class CartPage extends StatefulWidget{
  CartPage ({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}
class _CartPageState extends State<CartPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
      ),
    );
  }
}
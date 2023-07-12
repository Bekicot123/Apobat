import 'package:apobat/List_Flu/CardFlu.dart';
import 'package:flutter/material.dart';
import 'package:apobat/Page/Akun_Page.dart';
import 'package:apobat/Page/Cart_Page.dart';
import 'package:apobat/Page/Landing_Page.dart';

class Navbar extends StatefulWidget{
  const Navbar({super.key});
  @override
  State<Navbar> createState() => _NavBarState();
}

class _NavBarState extends State<Navbar> {
  int _selectIndex = 0;
  final _pagelist =[
    Landing_Page(),
    CartPage(),
    AkunPage(),
  ];
  onTappedItem(int Index){
    setState(() {
      _selectIndex = Index;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _pagelist.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          label: 'Beranda',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Keranjang',
          icon: Icon(Icons.shopping_basket),
        ),
        BottomNavigationBarItem(
          label: 'Akun',
          icon: Icon(Icons.manage_accounts) ,
        )
      ],
        currentIndex: _selectIndex,
        onTap: onTappedItem,
    ),
    );
  }
}
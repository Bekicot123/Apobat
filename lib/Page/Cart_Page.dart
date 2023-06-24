import 'package:apobat/Component/ButtonCart.dart';
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
                  '1',
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
                  'IDR 7000',
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
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(24),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Image.asset(
                       'lib/Image/obatflu.png',
                       width: 115,
                       height: 100,
                     ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                       Text('DECOLGEN TABLET',
                         style: TextStyle(
                           fontSize: 16,
                         ),
                       ),
                       Row(
                         children: [
                           IconButton(
                               onPressed: (){},
                               icon: Icon(
                                 Icons.add_circle,
                                 color: Colors.green,
                               ),
                           ),
                           Text(
                               '1'
                           ),
                           IconButton(
                             onPressed: (){},
                             icon: Icon(
                               Icons.remove_circle,
                               color: Colors.blue,
                             ),
                           ),
                           IconButton(
                             onPressed: (){},
                             icon: Icon(
                               Icons.takeout_dining,
                               color: Colors.red,
                             ),
                           ),
                         ],
                       ),
                       Text(
                         'IDR 7000',
                         style: TextStyle( fontWeight: FontWeight.bold),
                       ),
                      ],
                     ),
                   ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
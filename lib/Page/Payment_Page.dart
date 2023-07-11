import 'package:apobat/Component/ButtonCart.dart';
import 'package:flutter/material.dart';

class Payment_Page extends StatefulWidget{
  Payment_Page ({super.key});

  @override
  State<Payment_Page> createState() => _Payment_PageState();
}
class _Payment_PageState extends State<Payment_Page>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_rounded,
              size: 25,
              color: Colors.white,
            ),
          ),
        ],
          title: Center(
            child: Text('Pembayaran'),
          ),
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
            MyButtonCart(onTap: (){}, text: 'Bayar')
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pengiriman', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
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
                          SizedBox(height: 5,),
                          Text('1 Item',
                            style: TextStyle(
                              fontSize: 12, color: Colors.blueGrey
                            ),
                          ),
                          SizedBox(height: 15),
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
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(24),
              color: Colors.white,
              child: Column(
                children: [
                 Text(
                   'Pilih Metode Pembayaran',
                   style: TextStyle(fontSize: 17,),
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
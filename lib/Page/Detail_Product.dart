import 'package:apobat/Component/Button.dart';
import 'package:apobat/Component/ButtonCart.dart';
import 'package:flutter/material.dart';

class DetailProduct extends StatefulWidget {

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
              height: 70,
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_rounded,
                      size: 32,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text('Detail Obat', style: TextStyle(fontSize: 25,
                      fontWeight: FontWeight.bold,fontStyle: FontStyle.normal)
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              height: 200,
              color: Colors.white,
              child: Image.asset('lib/Image/obatflu.png', width: 200, height: 200,),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Decolgen Tablet', style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Deskripsi',
                    style: TextStyle(fontStyle: FontStyle.normal, fontSize: 14,
                    color: Colors.grey),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        'Rp 7000', style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  MyButtonCart(
                      onTap: (){},
                      text: 'Tambah Keranjang'
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}

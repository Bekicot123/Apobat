import 'package:apobat/Component/CardProduct.dart';
import 'package:flutter/material.dart';

class List_Obat extends StatefulWidget {
  @override
  State<List_Obat> createState() => _List_ObatState();
}

class _List_ObatState extends State<List_Obat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(24, 30, 24, 30),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'lib/Image/logo.png',
                      width: 170,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Find a medicine or\nvitamins with APOBAT!',
                      style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                    ),
                  ],
                ),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    size: 25,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal:16, vertical: 5),
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(hexColor('#DEF7FF')),
              ),
              child: TextField(
                decoration: InputDecoration(border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Color(hexColor('#81E1FF')),
                  ),
                  hintText: 'Search medicine ...',
                  hintStyle: TextStyle(color: Color(hexColor('#81E1FF'))),
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              'Flu Medicine List',
              style: TextStyle(fontSize: 15,),
            ),
            SizedBox(
              height: 20,
            ),
            CardProduct(),
          ],
        ),
      ),
    );
  }
}

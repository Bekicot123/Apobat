import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key});

  //final String imageProduct;
  //final String nameProduct;
  //final String price;

  //CardProduct({this.imageProduct, this.nameProduct, this.price});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(
            "lib/Image/obatflu.png",
            width: 115,
            height: 76,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Decolgen Tablet",
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            "Rp 7000",
            style: TextStyle(color: Color(hexColor('#FF2929'))),
          )
        ],
      ),
    );
  }
}

int hexColor(String color) {
  String newColor = '0xff$color';
  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}

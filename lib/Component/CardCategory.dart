import 'package:flutter/material.dart';

class CardCategory extends StatelessWidget {
  const CardCategory({super.key});

  //final String imageCategory;
  //final String nameCategory;

  //CardCategory({this.imageCategory, this.nameCategory});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'lib/Image/flu.png',
          width: 50,
          height: 50,
        ),
        const Text('Flu', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

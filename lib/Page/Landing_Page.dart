import 'package:apobat/Component/CardCategory.dart';
import 'package:apobat/Page/Akun_Page.dart';
import 'package:apobat/Page/Cart_Page.dart';
import 'package:apobat/Page/Home_Page.dart';
import 'package:flutter/material.dart';

class Landing_Page extends StatefulWidget {

  @override
  State<Landing_Page> createState() => _Landing_PageState();

}

class _Landing_PageState extends State<Landing_Page> {

  List catName = ["Demam", "Batuk", "Flu", "Vitamin", "Anak", "Magh"];
  List<Image> catImage = [
    Image.asset('lib/HomeImage/sick.png'),
    Image.asset('lib/HomeImage/cough.png'),
    Image.asset('lib/HomeImage/difficulty-breathing.png'),
    Image.asset('lib/HomeImage/children.png'),
    Image.asset('lib/HomeImage/children.png'),
    Image.asset('lib/HomeImage/diabetes.png')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(24, 30, 24, 30),
          children: [
            Row(
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
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(hexColor('#DEF7FF')),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(hexColor('#81E1FF')),
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
              'Pharmacy Service by Category',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Column(
                children: [
                  GridView.builder(
                      itemCount: catName.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.1,
                      ),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle
                              ),
                              child: Center(
                                child: catImage[index],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              catName[index],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        );
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

int hexColor(String color) {
  String newColor = '0xff' + color;
  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}

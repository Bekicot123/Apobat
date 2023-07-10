import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(24, 30, 24, 30),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
            Column(
              children: [
                SizedBox(height: 20,),
                Text(
                  "APOBAT", style: TextStyle(fontSize:38,fontWeight: FontWeight.bold,
                      color: Color(hexColor("#2E9DFA"))),
                ),
                SizedBox(height: 5,),
                Text(
                    "Version 1.0.0", style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                ),
                SizedBox(height: 5,),
                Image.asset(
                    "lib/Image/pills.png",
                  width: 100,
                ),
                SizedBox(height: 15,),
                Text(
                  "2023 | Ronggo Haikal & George A.Talakua",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 15,),
                Text(
                    "Support By :",
                  style: TextStyle(fontSize: 16,color: Colors.blueGrey),
                ),
                SizedBox(height: 15,),
                Text(
                  "Sekolah Tinggi Informatika & Komputer",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5,),
                Text(
                  "Indonesia",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 15,),
                Text(
                  "www.stiki.ac.id",
                  style: TextStyle(fontSize: 16,color: Color(hexColor("#2E9DFA"))),
                ),
                SizedBox(height: 15,),
                Image.asset(
                  "lib/Image/stiki.png",
                  width: 120,
                ),
              ],
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

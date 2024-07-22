import 'package:apobat/List_Batuk/ListBatuk.dart';
import 'package:apobat/List_Flu/ListFlu.dart';
import 'package:apobat/List_Vitamin/ListVitamin.dart';
import 'package:apobat/Page/About.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:apobat/Page/Help.dart';
import 'package:apobat/Page/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../List_Anak/ListAnak.dart';
import '../List_Demam/ListDemam.dart';
import '../List_Maag/ListMaag.dart';

class Landing_Page extends StatefulWidget {
  static const routeName = '/Landing_Page';
  final user = FirebaseAuth.instance.currentUser!;

  Landing_Page({super.key});

  @override
  State<Landing_Page> createState() => _Landing_PageState();
}

class _Landing_PageState extends State<Landing_Page> {
  void goToAboutPage() {
    //pop menu drawer
    Navigator.pop(context);

    //go to about page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const About(),
      ),
    );
  }

  void goToHelpPage() {
    //pop menu drawer
    Navigator.pop(context);

    //go to about page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Help(),
      ),
    );
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 12, 126, 69),
      drawer: MyDrawer(
        onAboutTap: goToAboutPage, //goToAboutPage
        onHelpTap: goToHelpPage,
        onSignOut: signUserOut,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 30, 24, 30),
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'lib/Image/logo2.png',
                      width: 170,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Find a medicine or\nvitamins with MEDILIFE',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            //   height: 55,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(8),
            //     color: Color(hexColor('#DEF7FF')),
            //   ),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       border: InputBorder.none,
            //       prefixIcon: Icon(
            //         Icons.search,
            //         color: Color(hexColor('#81E1FF')),
            //       ),
            //       hintText: 'Search medicine ...',
            //       hintStyle: TextStyle(color: Color(hexColor('#81E1FF'))),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 24,
            // ),

            const Text(
              'Pharmacy Service by Category',
              style: TextStyle(
                fontSize: 15,
                color: Color(
                    0xFFFCF8F3), // Menggunakan kode hex dan konstruktor Color
              ),
            ),

            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              children: <Widget>[
                Card(
                  margin: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VitaminList()));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          'lib/Image/vitamins.png',
                          width: 60,
                          height: 100,
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        const Text(
                          "Vitamin",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FluList()));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          'lib/Image/flu.png',
                          width: 60,
                          height: 100,
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        const Text(
                          "Flu",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BatukList()));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          'lib/Image/cough.png',
                          width: 60,
                          height: 100,
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        const Text(
                          "Batuk",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DemamList()));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          'lib/Image/sick.png',
                          width: 60,
                          height: 100,
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        const Text(
                          "Demam",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AnakList()));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          'lib/Image/children.png',
                          width: 60,
                          height: 100,
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        const Text(
                          "Anak",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MaagList()));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          'lib/Image/maag.png',
                          width: 60,
                          height: 100,
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        const Text(
                          "Maag",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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

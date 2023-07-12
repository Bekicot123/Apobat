import 'package:apobat/Component/CardCategory.dart';
import 'package:apobat/Page/About.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:apobat/Page/Akun_Page.dart';
import 'package:apobat/Page/Cart_Page.dart';
import 'package:apobat/Page/Help.dart';
import 'package:apobat/Page/Home_Page.dart';
import 'package:apobat/Page/drawer.dart';
import 'package:flutter/material.dart';

class Landing_Page extends StatefulWidget {
  static const routeName = '/Landing_Page';
  final user = FirebaseAuth.instance.currentUser!;
  @override
  State<Landing_Page> createState() => _Landing_PageState();

}

class _Landing_PageState extends State<Landing_Page> {

  void goToAboutPage(){
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
  void goToHelpPage(){
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
      drawer: MyDrawer(
        onAboutTap: goToAboutPage,//goToAboutPage
        onHelpTap: goToHelpPage,
        onSignOut: signUserOut,
      ),
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

            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              children: <Widget>[
                Card(
                  margin: const EdgeInsets.all(30.0),
                  child: InkWell(
                    onTap: (){},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget> [
                        Image.asset('lib/Image/vitamins.png', width: 60,),
                        SizedBox(height: 10,),
                        Text(
                          "Vitamin",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(30.0),
                  child: InkWell(
                    onTap: (){},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget> [
                        Image.asset('lib/Image/flu.png', width: 60,),
                        SizedBox(height: 10,),
                        Text(
                          "Flu",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(30.0),
                  child: InkWell(
                    onTap: (){},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget> [
                        Image.asset('lib/Image/cough.png', width: 60,),
                        SizedBox(height: 10,),
                        Text(
                          "Batuk",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(30.0),
                  child: InkWell(
                    onTap: (){},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget> [
                        Image.asset('lib/Image/sick.png', width: 60,),
                        SizedBox(height: 10,),
                        Text(
                          "Demam",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(30.0),
                  child: InkWell(
                    onTap: (){},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget> [
                        Image.asset('lib/Image/children.png', width: 60,),
                        SizedBox(height: 10,),
                        Text(
                          "Anak",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(30.0),
                  child: InkWell(
                    onTap: (){},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget> [
                        Image.asset('lib/Image/maag.png', width: 60,),
                        SizedBox(height: 10,),
                        Text(
                          "Maag",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
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
  String newColor = '0xff' + color;
  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}

import 'package:flutter/material.dart';
import 'package:apobat/Component/TextField.dart';

class loginpage extends StatelessWidget {
  loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: 140,
                child: Image.asset('lib/Image/pills.png'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'APOBAT',
                style: TextStyle(
                  color: Color(hexColor('#2E9DFA')),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.all(35.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText:'username',
                    prefixIcon: Icon(Icons.perm_identity, color: Colors.blue,),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(35.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText:'password',
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.blue,),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                      'Belum Punya akun?',
                    style: TextStyle(
                      color: Color(hexColor('#2E9DFA')),
                      fontSize: 25,
                  ),
                  ),
                ],
              ),

            ],
          ),
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

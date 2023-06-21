import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:apobat/Component/Button.dart';
import 'package:apobat/Component/TextField.dart';

class Register extends StatefulWidget {
  final Function()? onTap;

  Register({super.key, required this.onTap});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  void signIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      if (passwordController.text == confirmpasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        wrongconfrimPasswordMessage();
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Email Salah'),
          );
        });
  }

  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Password Salah'),
          );
        });
  }
  void wrongconfrimPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Password Tidak sama'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: emailController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: confirmpasswordController,
                  hintText: 'confrim Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  text: "Daftar",
                  onTap: signIn,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum Punya Akun ?',
                      style: TextStyle(color: Color(hexColor('#2E9DFA'))),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Masuk Disini',
                        style: TextStyle(color: Color(hexColor('#FFCD00'))),
                      ),
                    ),
                  ],
                )
              ],
            ),
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

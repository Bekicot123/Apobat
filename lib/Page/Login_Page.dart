import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:apobat/Component/Button.dart';
import 'package:apobat/Component/TextField.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
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
          return const AlertDialog(
            title: Text('Email Salah'),
          );
        });
  }

  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Password Salah'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 12, 126, 69),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 140,
                  child: Image.asset('lib/Image/medic.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'MEDILIFE',
                  style: TextStyle(
                    color: Color(hexColor('#FCF8F3')),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Color(0xFFFFCD00)), // Konversi warna hex ke Color
                    ),
                  obscureText: false, hintText: 'Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Color(0xFFFFCD00)), // Konversi warna hex ke Color
                    ),
                  obscureText: true, hintText: 'Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: signIn,
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // warna latar belakang tombol
                  ),
                    child: Text('Masuk',
                    style: TextStyle(
                    color: Colors.black, // warna teks
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum Punya Akun ?',
                      style: TextStyle(color: Color(hexColor('#FCF8F3'))),
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
  String newColor = '0xff$color';
  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}

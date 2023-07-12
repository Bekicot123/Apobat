import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:apobat/Component/Button.dart';
import 'package:apobat/Component/TextField.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final namaController = TextEditingController();
  final alamatController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUp() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
          child:  CircularProgressIndicator(),
        ),
    );

    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
      );

      FirebaseFirestore.instance
      .collection("Users")
      .doc(userCredential.user!.email)
      .set({
        'username' : usernameController.text,
        'email' : emailController.text,
        'fullname' : namaController.text,
        'password' : passwordController.text,
        'address' : alamatController.text,
      });

      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e){
      Navigator.pop(context);
      displayMessage(e.code);
    }
  }
  
  void displayMessage(String message){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(message),
        ),
    );
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
                  height: 10,
                ),
                Container(
                  height: 100,
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
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: namaController,
                  hintText: 'Nama Lengkap',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: alamatController,
                  hintText: 'Alamat',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
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
                const SizedBox(height: 20,),
                MyButton(
                  text: "Daftar",
                  onTap: signUp,
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah Punya Akun ?',
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
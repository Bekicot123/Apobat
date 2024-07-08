import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:apobat/Component/Button.dart';
import 'package:apobat/Component/TextField.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

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
        child: CircularProgressIndicator(),
      ),
    );

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'username': usernameController.text,
        'email': emailController.text,
        'fullname': namaController.text,
        'password': passwordController.text,
        'address': alamatController.text,
      });

      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code);
    }
  }

  void displayMessage(String message) {
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
      backgroundColor: Color.fromARGB(255, 12, 126, 69),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 100,
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
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Color(0xFFFFCD00)), // Konversi warna hex ke Color
                    ),
                  obscureText: false, hintText: 'Username',
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: namaController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Color(0xFFFFCD00)), // Konversi warna hex ke Color
                    ),
                  obscureText: false, hintText: 'Name',
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: alamatController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Color(0xFFFFCD00)), // Konversi warna hex ke Color
                    ),
                  obscureText: false, hintText: 'Alamat',
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
                  obscureText: false, hintText: 'Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: signUp,
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // warna latar belakang tombol
                  ),
                    child: Text('Daftar',
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
                      'Sudah Punya Akun ?',
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

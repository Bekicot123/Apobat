import 'package:flutter/material.dart';
import 'package:apobat/Component/Button.dart';
import 'package:apobat/Component/TextField.dart';

class RegisterPage extends StatelessWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  final usernameController = TextEditingController();
  final namaController     = TextEditingController();
  final alamatController   = TextEditingController();
  final emailController    = TextEditingController();
  final passwordController = TextEditingController();

  void signIn(){}
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
                  onTap: signIn,
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
                      onTap: onTap,
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

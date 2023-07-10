import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
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
                SizedBox(height: 10,),
                Text(
                  "Tips menggunakan aplikasi APOBAT", style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,
                    color: Color(hexColor("#2E9DFA"))),
                ),
                SizedBox(height: 5,),
                Text(
                  "Version 1.0.0", style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                ),
                SizedBox(height: 15,),
                Text(
                  "1. Pertama, Silahkan Anda Login/Register terlebih dahulu.\n2. Setelah itu, Anda akan masuk pada Home page.\n3. Pada Home page Anda dapat mencari obat dengan fitur search bar atau pada menu kategori layanan apotik.\n4. Setelah Anda menemukan obat yang dicari, silahkan klik lalu akan muncul detail obat serta tombol tambah keranjang.\n5. Tekan tombol tambah keranjang lalu obat yang Anda pilih akan masuk pada halaman keranjang.\n6. Pada halaman keranjang akan muncul detail dari harga obat, jumlah item yang dibeli serta tombol check out.\n7. Setelah itu, tekan tombol check out lalu Anda akan masuk pada halaman pembayaran untuk melakukan pembelian.\n8. Pada halaman pembayaran Anda dapat memilih metode pembayaran\n9. Setelah itu, silahkan Anda menekan tombol bayar untuk melakukan pembelian.\n10. Selamat pembelian obat Anda berhasil dan obat sedang dalam proses pengiriman.",
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 15,),
                Text(
                  "Support By :",
                  style: TextStyle(fontSize: 16,color: Colors.blueGrey),
                ),
                SizedBox(height: 10,),
                Text(
                  "Sekolah Tinggi Informatika & Komputer",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5,),
                Text(
                  "Indonesia",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10,),
                Text(
                  "www.stiki.ac.id",
                  style: TextStyle(fontSize: 16,color: Color(hexColor("#2E9DFA"))),
                ),
                SizedBox(height: 10,),
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

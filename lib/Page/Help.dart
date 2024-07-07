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
          padding: const EdgeInsets.fromLTRB(24, 30, 24, 30),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    size: 25,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Tips menggunakan aplikasi APOBAT",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(hexColor("#2E9DFA"))),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Version 1.0.0",
                  style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "1. Pertama, Silahkan Anda Login/Register terlebih dahulu.\n2. Setelah itu, Anda akan masuk pada Home page.\n3. Pada Home page Anda dapat mencari obat dengan fitur search bar atau pada menu kategori layanan apotik.\n4. Setelah Anda menemukan obat yang dicari, silahkan klik lalu akan muncul detail obat serta tombol tambah keranjang.\n5. Tekan tombol tambah keranjang lalu obat yang Anda pilih akan masuk pada halaman keranjang.\n6. Pada halaman keranjang akan muncul delivery destination dimana ada nama serta alamat Anda, detail dari harga obat, jumlah item yang dibeli,kolom pilih metode pembayaran serta tombol check out untuk melakukan pembelian.\n7. Setelah itu, tekan tombol check out untuk melakukan pembelian\n8. Selamat pembelian obat Anda berhasil dan obat sedang dalam proses pengiriman.",
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Support By :",
                  style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Sekolah Tinggi Informatika & Komputer",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Indonesia",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "www.stiki.ac.id",
                  style: TextStyle(
                      fontSize: 16, color: Color(hexColor("#2E9DFA"))),
                ),
                const SizedBox(
                  height: 10,
                ),
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
  String newColor = '0xff$color';
  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}

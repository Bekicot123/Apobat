import 'package:apobat/Component/CardProduct.dart';
import 'package:flutter/material.dart';

class List_Obat extends StatefulWidget {
  const List_Obat({Key? key}) : super(key: key);

  @override
  State<List_Obat> createState() => _List_ObatState();
}

class _List_ObatState extends State<List_Obat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: true,
            title: const Text('APOBAT'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () {},
            ),
            actions: [
              Padding(
                  padding: const EdgeInsets.all(10.0),
                child: Image.asset("lib/Image/pills.png",
                ),
              ),
              //IconButton(
                //icon: const Icon(Icons.medical_services),
                //onPressed: () {},
              //),
            ],
            bottom: AppBar(
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari Obat',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('\n\n\t\t\t\tObat Flu',style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CardProduct()
            ]),
          ),
        ],
      ),
    );
  }
}

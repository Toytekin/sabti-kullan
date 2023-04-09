import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../teme_renk.dart';

class DizaynHome extends StatefulWidget {
  const DizaynHome({super.key});

  @override
  State<DizaynHome> createState() => _DizaynHomeState();
}

class _DizaynHomeState extends State<DizaynHome> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarm(),
      body: ListView(
        children: [
          //? ÜST ALAN VE ARAMA KISMININ OLACAĞI YER
          StackAramaKismi(searchController: searchController),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Profil Resimleri'),
                TextButton(onPressed: () {}, child: const Text('Daha Fazla'))
              ],
            ),
          ),
          birinciSatir(),
          birinciSatir()
        ],
      ),
    );
  }

  Container birinciSatir() {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        height: Get.height * 0.3,
        width: Get.width,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => debugPrint('Tiklandı $index'),
              child: Kartlar(
                fiyat: '22',
                urunAdi: 'Çiçek',
                icon: const Icon(Icons.sd_card),
              ),
            );
          },
        ));
  }

  AppBar appbarm() {
    return AppBar(
      backgroundColor: anaRenk,
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: yaziRenk,
          )),
      elevation: 0,
    );
  }
}

// ignore: must_be_immutable
class Kartlar extends StatelessWidget {
  Kartlar({
    Key? key,
    required this.urunAdi,
    required this.fiyat,
    required this.icon,
  }) : super(key: key);

  String urunAdi;
  String fiyat;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: anaRenk,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: (Get.height * 0.25) * 0.9,
        height: (Get.height * 0.25) - 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 2),
            icon,
            Text(urunAdi),
          ],
        ),
      ),
    );
  }
}

class StackAramaKismi extends StatelessWidget {
  const StackAramaKismi({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.2,
      child: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.2 - 27,
            decoration: const BoxDecoration(
              color: anaRenk,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              // TEXTFİELD
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                    hintText: 'Search',
                    focusColor: yaziRenk,
                    filled: true,
                    fillColor: aarkaplanRenk,
                    contentPadding: EdgeInsets.only(
                        left: 28.0, bottom: 5, top: 5.0, right: 28),
                    prefixIcon: Icon(
                      Icons.search,
                      color: yaziRenk,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    //? TIKLANINCA GÖZÜKME ŞEKLİ
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: yaziRenk),
                    ),
                    //? TIKLANMDAN GÖZÜKME ŞEKLİ
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                        borderSide: BorderSide(width: 2, color: yaziRenk))),
              ),
            ),
          )
        ],
      ),
    );
  }
}

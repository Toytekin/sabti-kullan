import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AramaCubugu extends SearchDelegate {
  final List tumListem;
  // Orjinal yorumlanmıştır
  // final List<DbKartvizizt> tumListem;

  AramaCubugu({required this.tumListem});
  //var box = Hive.box<DbKartvizizt>('dbkartvizit');
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query.isEmpty ? null : query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //?  yükleme ekranında gitmesi istenen sayfa
        //   Get.off(const HomeScreeen());
      },
      child: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //Orjinal yorumlanmıştır
    // List<DbKartvizizt> filtrelist = tumListem

    //? Filtreleme işlemi
    List filtrelist = tumListem
        .where(
            (element) => element.ad.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return filtrelist.isNotEmpty
        ? ListView.builder(
            itemCount: filtrelist.length,
            itemBuilder: (context, index) {
              var oAnkiEleman = filtrelist[index];

              return GestureDetector(
                onTap: () {
                  // arama işleminde çıkan sonuçlardan birtanesine
                  //  tıklandığında olacak olanı yazıyorz
                  //      Get.off(KartDetaySayfasi(id: oAnkiEleman.id));
                },
                // Arama işlemi bittikden sonra veriler nasıl gelmesini istiyorsak burada ayarlıyoruz.
                child: Card(
                    margin: const EdgeInsets.all(10),
                    child: Image.file(File(oAnkiEleman.imagePath))),
              );
            },
          )
        : Center(child: Text('aramasonucyk'.tr));
  }

  Future<void> silme(int index) async {
    //? Orjinali yorumlanmıştır
    // await box.deleteAt(index);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

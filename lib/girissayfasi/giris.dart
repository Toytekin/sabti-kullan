import 'package:flutter/material.dart';
import 'package:flutter_application_1/girissayfasi/kaydolma_ekrani.dart';
import 'package:flutter_application_1/teme_renk.dart';
import 'package:get/get.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({super.key});

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: aarkaplanRenk,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo(),
              Container(
                width: 100,
                margin: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: anaRenk,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: TextButton(
                    onPressed: () {
                      Get.to(const KaydolmaEkrani());
                    },
                    child: const Text(
                      'Kaydol',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container logo() {
    return Container(
      width: 300,
      height: 200,
      color: anaRenk,
      child: const Center(
          child: Text('Resim veya logonun geleceği alan burası olacak')),
    );
  }
}

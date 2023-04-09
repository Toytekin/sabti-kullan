import 'package:flutter/material.dart';
import 'package:flutter_application_1/teme_renk.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//!
// font_awesome_flutter paketini kullandım
// Yükleme   flutter pub add font_awesome_flutter

class KaydolmaEkrani extends StatefulWidget {
  const KaydolmaEkrani({super.key});

  @override
  State<KaydolmaEkrani> createState() => _KaydolmaEkraniState();
}

class _KaydolmaEkraniState extends State<KaydolmaEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Butonlar(
                  arkaRenk: cfacbookColr,
                  icon: const FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.white,
                  ),
                  text: 'Facebook İle Giriş',
                  yaziRenk: Colors.white,
                  textSize: 20),
            ),
            Butonlar(
                arkaRenk: Colors.white,
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                ),
                text: 'Google İle Giriş',
                yaziRenk: yaziRenk,
                textSize: 20),
            Butonlar(
                arkaRenk: Colors.orange,
                icon: const FaIcon(
                  FontAwesomeIcons.phone,
                ),
                text: 'Telefon  İle Giriş',
                yaziRenk: yaziRenk,
                textSize: 20),
          ],
        ),
      )),
    );
  }
}

// ignore: must_be_immutable
class Butonlar extends StatelessWidget {
  Butonlar({
    Key? key,
    required this.arkaRenk,
    required this.icon,
    required this.text,
    required this.yaziRenk,
    required this.textSize,
  }) : super(key: key);

  Color arkaRenk;
  Widget icon;
  String text;
  Color yaziRenk;
  double textSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: Get.width,
      height: Get.width / 5,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              color: Colors.black,
              offset: Offset.zero,
            )
          ],
          color: arkaRenk,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            icon,
            Text(
              text,
              style: TextStyle(color: yaziRenk, fontSize: textSize),
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}

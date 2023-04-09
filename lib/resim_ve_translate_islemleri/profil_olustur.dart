import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pdf/textfieldprofil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

//!◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.
//?  Get paketini indirmelisin
//?  hive paketini indirmelisi
//?  image_picker paketini indirmelisin
//! paketlere tek tek bakıp gerekli ayarlamalar varmı diye kontrol et pub devden

// herhangi bir butonda  pdfOlistir() çağırınca pdf oluşturracak
//!  U y a  r ı  ! ! !
// türkçe karakterler pdf oluşturmada hata veriyor
// onun için textfild içerisinde
// yanda örnek textfield filtreleme dosyası bırakıyorum
//!◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.

class ProfilOlustur extends StatefulWidget {
  const ProfilOlustur({super.key});

  @override
  State<ProfilOlustur> createState() => _ProfilOlusturState();
}

class _ProfilOlusturState extends State<ProfilOlustur> {
  TextEditingController adController = TextEditingController();
  TextEditingController sirketController = TextEditingController();
  TextEditingController unvanController = TextEditingController();
  TextEditingController adresController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController wepController = TextEditingController();

  ImagePicker imagePicker = ImagePicker();
  File? dosya;
  String? dosyaYolu;
  bool profilTiklama = false;

  //  var box = Hive.box<KartModel>('db');
  var box;
  @override
  void initState() {
    super.initState();
    verileriDenetle();
  }

  verileriDenetle() {
    box.keys.forEach((element) {
      if (element == 1) {
        box.values.forEach((element) {
          adController.text = element.ad;
          sirketController.text = element.sirket;
          unvanController.text = element.unvan;
          adresController.text = element.adres;
          telController.text = element.tel;
          wepController.text = element.wep;
          dosyaYolu = element.imagePath;
        });
      } else {
        null;
      }
    });
  }

  // @override
  // Future<Image> _getProfilResim() async {
  //   return await Image.file(
  //     File(dosyaYolu!),
  //     fit: BoxFit.contain,
  //   );
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarr(),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              profilTiklama = true;
              // Resim için yönlendirme
              resmiCek(ImageSource.gallery);
            },
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: dosyaYolu != null
                  ? Image.file(
                      File(dosyaYolu!),
                      fit: BoxFit.contain,
                    )
                  : const Icon(
                      Icons.photo_camera,
                      size: 50,
                    ),
            ),
          ),
          const Divider(),
          sbtTextformfieldProfil.textformfield(adController, 'adsyd'.tr),
          const Divider(),
          sbtTextformfieldProfil.textformfield(sirketController, 'sirket'.tr),
          const Divider(),
          sbtTextformfieldProfil.textformfield(unvanController, 'unvan'.tr),
          const Divider(),
          sbtTextformfieldProfil.textformfield(adresController, 'Adres'),
          const Divider(),
          sbtTextformfieldProfil.textformfield(telController, 'tel'.tr),
          const Divider(),
          sbtTextformfieldProfil.textformfield(wepController, 'Wep'.tr),
          //! Buton
          TextButton(
              onPressed: () {
                if (profilTiklama == true) {
                  kaydet();
                  debugPrint(box.values.first.imagePath.toString());
                  //  Get.to(const HomeScreeen());
                } else {
                  setState(() {
                    Get.snackbar('Uyarı', 'Profil Resmi Seçmelkisin !',
                        backgroundColor: Colors.grey);
                  });
                }
              },
              child: Text(
                //!  T R  A N S  L A T E    İ Ş L E M İ
                // ceviri.dart da belirtiğimiz kelimeyi giriyoz
                // sistem diline göre o karar verecek
                // bu işlemin çalışması için main içerisinde GetMaterialApp altına aşağıdakini yapıştır
                //? translations: Messages(),
                //? locale: Get.deviceLocale,
                //? fallbackLocale: const Locale('en', 'UK'),
                'kaydet'.tr,
                style: const TextStyle(color: Colors.red, fontSize: 20),
              )),
          const Divider(),
        ],
      ),
    );
  }

  AppBar appbarr() {
    return AppBar(
      automaticallyImplyLeading: false,
      // Geri gelme iconu
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back)),
      elevation: 0,
      backgroundColor: Colors.red,
      title: Text(
        'Card App',
        style: GoogleFonts.satisfy(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  Future<void> resmiCek(ImageSource source) async {
    var foto = await imagePicker.pickImage(source: source);
    setState(() {
      if (foto?.path != null) {
        dosya = File(foto!.path);
        dosyaYolu = dosya?.path;
      } else {
        Get.off(ProfilOlustur());
      }
    });
  }

  Future<void> kaydet() async {
    // var veri = KartModel(
    //   ad: adController.text,
    //   sirket: sirketController.text,
    //   unvan: unvanController.text,
    //   adres: adresController.text,
    //   tel: telController.text,
    //   wep: wepController.text,
    //   imagePath: dosyaYolu.toString(),
    // );
    var veri;
    await box.put(1, veri);
  }
}

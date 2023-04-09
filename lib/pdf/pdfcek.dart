import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';

//!◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.
//?  path_provider paketini indirmelisin
//?  open_filex paketini indirmelisin

// SAbit paddingler ayarlayarak stabil görüntü elde edebilirsain
//!◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.

Future<void> kaydetVeGetirDosyalari(List<int> bytes, String dosyaAdi) async {
  final path = (await getExternalStorageDirectory())?.path;
  final file = File('$path/$dosyaAdi');
  await file.writeAsBytes(bytes, flush: true);
  OpenFilex.open('$path/$dosyaAdi');
  debugPrint('Oldu');
}

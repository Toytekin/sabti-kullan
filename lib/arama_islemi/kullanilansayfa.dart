import 'dart:js';

import 'package:flutter/material.dart';

import 'aramacubugu.dart';

//!◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.
//?  SİZER paketini indirmelisin
// SAbit paddingler ayarlayarak stabil görüntü elde edebilirsain
//!◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.

// verileri biz veri tabanımımızdan modelimize göre çektiğimiz bir liste olmalı
var veriler;

//? herhangi bir butonun altınafonksiyonu çağır
IconButton apbarSearch() {
  return IconButton(
      onPressed: () {
        //ststful widget kullandığımızda context sorunu ortadan kalkacak

        //   aramaislemi(context);
      },
      icon: const Icon(
        Icons.search,
        size: 30,
      ));
}

Future<void> aramaislemi(BuildContext context) async {
  await showSearch(
    context: context,
    delegate: AramaCubugu(tumListem: veriler),
  );
}

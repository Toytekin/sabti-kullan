import 'package:flutter/services.dart';
import 'package:flutter_application_1/pdf/pdfcek.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

//!◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.
//?  syncfusion_flutter_pdf paketini indirmelisin
//?  hive paketini indirmelisin

//? paketlere tek tek bakıp gerekli ayarlamalar varmı diye kontrol et pub devden

// herhangi bir butonda  pdfOlistir() çağırınca pdf oluşturracak
//!  U y a  r ı  ! ! !
// türkçe karakterler pdf oluşturmada hata veriyor
// onun için textfild içerisinde
// yanda örnek textfield filtreleme dosyası bırakıyorum
//!◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.◣ ◤ ◥ ◬ ◭ ◮ ⫷ ⫸.

//? Yorum satırındaki var HİVE
//var box = Hive.box<KartModel>('db');
var box;

Future<void> pdfOlistir() async {
  PdfDocument document = PdfDocument();
  final page = document.pages.add();

  page.graphics.drawString(
    'MyCardApp',
    PdfStandardFont(PdfFontFamily.helvetica, 25),
  );

// Create a PDF grid class to add tables.
  final PdfGrid grid = PdfGrid();

//Stil verme
  grid.style = PdfGridStyle(font: PdfStandardFont(PdfFontFamily.helvetica, 18));
// Specify the grid column count.
  grid.columns.add(count: 2);

// Add rows to the grid.
  PdfGridRow row = grid.rows.add();
  row.cells[0].value = 'Ad Soyad';
  row.cells[1].value = box.values.first.ad;

// Add next row.
  row = grid.rows.add();
  row.cells[0].value = 'Unvan';
  row.cells[1].value = box.values.first.unvan;
// Add next row.
  row = grid.rows.add();
  row.cells[0].value = 'Sirket';
  row.cells[1].value = box.values.first.sirket;
  // Add next row.
  row = grid.rows.add();
  row.cells[0].value = 'Adres';
  row.cells[1].value = box.values.first.adres;
  // Add next row.
  row = grid.rows.add();
  row.cells[0].value = 'Tel';
  row.cells[1].value = box.values.first.tel;
  // Add next row.
  row = grid.rows.add();
  row.cells[0].value = 'Wep';
  row.cells[1].value = box.values.first.wep;
// Set grid format.
  grid.style.cellPadding = PdfPaddings(left: 5, top: 5);
// Draw table in the PDF page.
  grid.draw(
      page: page,
      bounds: Rect.fromLTWH(
          0, 50, page.getClientSize().width, page.getClientSize().height));
  // !Resim ayaralama
  //page.graphics.drawImage(PdfBitmap(await _getResim('item-03.png')),
  //  const Rect.fromLTWH(100, 100, 100, 100));

  //! Tablo ayaralama
  // PdfGrid grid = PdfGrid();
  // grid.style = PdfGridStyle(
  //     font: PdfStandardFont(PdfFontFamily.helvetica, 30),
  //     cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
  // grid.columns.add(count: 3);
  // grid.headers.add(1);

  // PdfGridRow header = grid.headers[0];
  // header.cells[0].value = 'Deneme ';
  // header.cells[1].value = 'Bİlanco';
  // header.cells[2].value = 'Merçççhaba';

  // PdfGridRow gelenn = grid.rows.add();
  // header.cells[0].value = '1';
  // header.cells[1].value = '1';
  // header.cells[2].value = '1';

  // PdfGridRow row = grid.rows.add();

  // grid.draw(
  //     page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));

  List<int> bytes = await document.save();
  document.dispose();
  kaydetVeGetirDosyalari(bytes, 'oluşturulan.pdf');
}

Future<Uint8List> _getResim(String name) async {
  final data = await rootBundle.load('assets/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}

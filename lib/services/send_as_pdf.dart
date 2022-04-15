import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<void> sendAsPdf(String text) async {
  final pdf = pw.Document();
  var data = await rootBundle.load("assets/OpenSans-Regular.ttf");
  var myStyle = pw.TextStyle(font: pw.Font.ttf(data));
  pdf.addPage(
    pw.Page(build: (pw.Context context) {
      return pw.Center(
        child: pw.Text(text, style: myStyle),
      );
    }),
  );
  final output = await getTemporaryDirectory();
  final file = File('${output.path}/text.pdf');
  await file.writeAsBytes(await pdf.save());
  await Printing.sharePdf(bytes: await pdf.save(), filename: 'text.pdf');
}

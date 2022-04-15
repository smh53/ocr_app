import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

void copyToClipboard(BuildContext context, String text) {
  Clipboard.setData(ClipboardData(text: text)).then((value) {
    FlutterToastr.show("Panoya Kopyalandı !", context,
        duration: FlutterToastr.lengthShort, position: FlutterToastr.bottom);
  });
}

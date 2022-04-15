import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

Future<String> imageToText() async {
  final ImagePicker _picker = ImagePicker();

  final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);

  if (photo != null) {
    final inputImage = InputImage.fromFilePath(photo.path);
    final textDetector = GoogleMlKit.vision.textDetector();
    final RecognisedText recognisedText =
        await textDetector.processImage(inputImage);

    return recognisedText.text;
  } else {
    return "RESİM SEÇMEDİNİZ!";
  }
}

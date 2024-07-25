import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<void> pikImageFile(File? imageFile) async {
    var picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    } else {
      print('no image selected');
    }
  }
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductController extends GetxController {
  final RxList<File> images = List<File>().obs;
  final ImagePicker picker = ImagePicker();

  void addImages(bool isFromCamera) async {
    final result =
        isFromCamera ? await imgFromCamera() : await imgFromGallery();
    images.add(result);
  }

  void removeImages(File image) {
    images.remove(image);
  }

  Future imgFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future imgFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }
}

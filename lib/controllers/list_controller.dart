import 'dart:io';

import 'package:get/get.dart';
import 'package:xetia_shop/controllers/image_picker_controller.dart';
import 'package:xetia_shop/models/_model.dart';

class ListController extends GetxController {
  final RxList<File> images = List<File>().obs;
  final ImagePickerController _imagePickerController =
      Get.put(ImagePickerController());

  void addImages(bool isFromCamera) async {
    final result = isFromCamera
        ? await _imagePickerController.imgFromCamera()
        : await _imagePickerController.imgFromGallery();
    images.add(result);
  }

  void removeImages(File image) {
    images.remove(image);
  }

  int imagesLength() => images.length;

  RxList<MessageItem> listMessage = List<MessageItem>().obs;

  void addMessage(MessageItem messageItem) {
    listMessage.add(messageItem);
  }
}

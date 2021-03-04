import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/list_controller.dart';
import 'package:xetia_shop/language/_components.dart';
import 'package:xetia_shop/ui/components/_components.dart';

class AddProductPicture extends StatelessWidget {
  AddProductPicture({
    Key key,
  }) : super(key: key);

  final ListController _listController = Get.put(ListController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.theme.primaryColorDark,
      ),
      child: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              child:
                  Text(kProductPicture.tr, style: context.textTheme.headline3),
            ),
            _listController.images.isEmpty
                ? Container(
                    margin: EdgeInsets.all(20),
                    child: MyButton(
                      onTap: () {
                        _listController.addImages(false);
                      },
                      text: kBrowsePicture.tr,
                      color: context.theme.primaryColor,
                    ),
                  )
                : Container(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: _listController.imagesLength() + 1,
                      itemBuilder: (context, index) {
                        if (index == _listController.imagesLength()) {
                          return AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: context.theme.primaryColor,
                              ),
                              child: InkWell(
                                onTap: () {
                                  _listController.addImages(false);
                                },
                                child: Center(
                                  child: Text(
                                    kBrowsePicture.tr,
                                    textAlign: TextAlign.center,
                                    style: context.textTheme.headline3,
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              height: 100,
                              width: 200,
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: context.theme.primaryColor,
                                  width: 2,
                                ),
                                color:
                                    context.theme.primaryColor.withOpacity(0.5),
                              ),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        _listController.images[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      margin: EdgeInsets.all(4),
                                      decoration: ShapeDecoration(
                                          shape: CircleBorder(),
                                          color: Colors.white,
                                          shadows: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                blurRadius: 2),
                                          ]),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.close_rounded,
                                          color: context.theme.primaryColor,
                                          size: 15,
                                        ),
                                        onPressed: () {
                                          _listController.removeImages(
                                              _listController.images[index]);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

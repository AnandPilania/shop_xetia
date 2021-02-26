import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/ui/components/_components.dart';
import 'package:xetia_shop/utils/_utils.dart';

class AddProductSheet extends StatelessWidget {
  final AddProductController _addProductController =
      Get.put(AddProductController());
  final OptionButtonController _optionButtonController =
      Get.put(OptionButtonController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: Column(
        children: [
          SheetHeader(
            title: "Add Products",
            onTap: () {
              Get.back();
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  AddProductPicture(),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: context.theme.primaryColorDark,
                    ),
                    padding: EdgeInsets.all(20),
                    child: ExpandablePanel(
                      header: Text("Product Detail",
                          style: context.textTheme.headline3),
                      expanded: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            XetiaDivider(),
                            SizedBox(height: 20),
                            XetiaTextField(
                              textInputType: TextInputType.text,
                              controller:
                                  _addProductController.productNameController,
                              validator: Validator().notEmpty,
                              hintText: "Type your product name",
                            ),
                            SizedBox(height: 10),
                            XetiaTextField(
                              textInputType: TextInputType.text,
                              controller:
                                  _addProductController.categoryController,
                              validator: Validator().notEmpty,
                              hintText: "search category",
                            ),
                            SizedBox(height: 10),
                            XetiaTextField(
                              textInputType: TextInputType.text,
                              controller: _addProductController.priceController,
                              validator: Validator().notEmpty,
                              hintText: "Type your product type",
                            ),
                            SizedBox(height: 20),
                            XetiaDivider(),
                            ToggleButton(
                              text: "WholeSaler",
                              value: true,
                              onTap: () {},
                              onChanged: (bool value) {},
                            ),
                            ToggleButton(
                              text: "Saler",
                              value: true,
                              onTap: () {},
                              onChanged: (bool value) {},
                            ),
                            XetiaDivider(),
                            SizedBox(height: 20),
                            Text(
                              "Stock",
                              style: context.textTheme.headline3,
                            ),
                            SizedBox(height: 15),
                            OptionButtons(
                              listOption: _optionButtonController.weights,
                              option: _optionButtonController.weight,
                              onChanged: _optionButtonController.setWeight,
                            ),
                            SizedBox(height: 15),
                            XetiaTextField(
                              textInputType: TextInputType.text,
                              controller: _addProductController.priceController,
                              validator: Validator().notEmpty,
                              hintText: "Type your minimum order",
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Condition",
                              style: context.textTheme.headline3,
                            ),
                            SizedBox(height: 15),
                            OptionButtons(
                              listOption: _optionButtonController.heights,
                              option: _optionButtonController.height,
                              onChanged: _optionButtonController.setHeight,
                            ),
                            SizedBox(height: 20),
                            XetiaDivider(),
                            SizedBox(height: 20),
                            Text(
                              "Delivery Detail",
                              style: context.textTheme.headline3,
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: OptionButtons(
                                    listOption: _optionButtonController.weights,
                                    option: _optionButtonController.weight,
                                    onChanged:
                                        _optionButtonController.setWeight,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: 5,
                                    ),
                                    child: XetiaTextField(
                                      textInputType: TextInputType.text,
                                      controller: _addProductController
                                          .weightController,
                                      validator: Validator().notEmpty,
                                      hintText: "Weight",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: OptionButtons(
                                    listOption: _optionButtonController.weights,
                                    option: _optionButtonController.weight,
                                    onChanged:
                                        _optionButtonController.setWeight,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: 5,
                                    ),
                                    child: XetiaTextField(
                                      textInputType: TextInputType.text,
                                      controller: _addProductController
                                          .heightController,
                                      validator: Validator().notEmpty,
                                      hintText: "Height",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            XetiaDivider(),
                            SizedBox(height: 20),
                            Text(
                              "Postage",
                              style: context.textTheme.headline3,
                            ),
                            SizedBox(height: 15),
                            OptionButtons(
                              listOption: _optionButtonController.posts,
                              option: _optionButtonController.post,
                              onChanged: _optionButtonController.setPost,
                            ),
                          ],
                        ),
                      ),
                      theme: ExpandableThemeData(
                        iconColor: context.theme.primaryColor,
                        alignment: Alignment.centerLeft,
                        bodyAlignment: ExpandablePanelBodyAlignment.center,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: MyButton(
                        color: context.theme.primaryColor,
                        onTap: () {},
                        text: "Add Product"),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class XetiaDivider extends StatelessWidget {
  const XetiaDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      decoration: BoxDecoration(
        color: context.theme.primaryColorLight,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}

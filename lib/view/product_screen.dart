import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testflutter/controller/product_controller.dart';
import 'package:testflutter/model/product_model.dart';

ProductController productController = Get.put(ProductController(
    productModel: ProductModel(name: "نوشابه", price: "5000", off: "30").obs));

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx((() {
            return Column(
              children: [
                Text(
                  "product name: ${productController.productModel.value.name}",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "product price: ${productController.productModel.value.price}",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "product off: ${productController.productModel.value.off}",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            );
          })),
          ElevatedButton(
              onPressed: (() {
                productController.productModel.update((val) {
                  val!.name = "cheetoze";
                  val.price = "2000";
                  val.off = "40%";
                });
              }),
              child: Text("press")),
        ],
      ),
    ));
  }
}

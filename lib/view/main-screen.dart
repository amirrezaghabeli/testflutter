import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testflutter/controller/product_controller.dart';
import 'package:testflutter/model/product_model.dart';
import 'package:testflutter/view/product_screen.dart';

class MainScreen extends StatelessWidget {
  // var counter=0.obs;
  // RxInt counter=0.obs;
  // var counter=RxInt(0);
  // var counter = Rx<int>(0);

  ProductController productController = Get.put(ProductController(
      productModel:
          ProductModel(name: "بستنی کیم", off: "50", price: "15000").obs));

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
                  val!.name = "cheetoze talaie";
                  val.price = "2000";
                  val.off = "40%";
                });
              }),
              child: Text("press")),
              ElevatedButton(
              onPressed: (() {
                Get.to(ProductScreen());
                }
              ),
              child: Text("Go")),
        ],
      ),
    ));
  }
}

import 'package:get/get.dart';
import 'package:testflutter/model/product_model.dart';

class ProductController extends GetxController{
  Rx<ProductModel> productModel;

  ProductController({required this.productModel});
}
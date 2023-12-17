import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/api_integration/using_http/controller/productcontroller.dart';
import 'package:machine_test/api_integration/using_http/view/product_tile.dart';


void main(){
  runApp(MaterialApp(home: ProductHomepage()));
}


class ProductHomepage extends StatelessWidget {

  final Products_Control productController=Get.put(Products_Control());
  ProductHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api"),),
      body: Obx((){
        if(productController.isLoading.value){
          return Center(child: CircularProgressIndicator(),);
        }else{
          return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context,index){
                return ProductTile(productController.productcart[index]);
              });
        }
      }),
    );
  }
}

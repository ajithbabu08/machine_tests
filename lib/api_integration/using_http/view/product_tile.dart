import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/productsmodel.dart';



class ProductTile extends StatelessWidget {

  final MyProducts mproducts;
  ProductTile(this.mproducts);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)
              )),
            child: CachedNetworkImage(
              imageUrl: mproducts.image!,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 10,),
          Text(mproducts.title!),
          // Text("${mproducts.price}")
        ],
      ),
    );
  }
}

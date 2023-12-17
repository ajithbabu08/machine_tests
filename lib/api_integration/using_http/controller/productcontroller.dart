import 'package:get/get.dart';

import '../service/productservicepage.dart';

class Products_Control extends GetxController{
var isLoading=true.obs;
var productcart=[].obs;

@override
  void onInit() {
  getmyProducts();
    super.onInit();
  }


void getmyProducts()async{
  try{
    isLoading(true);
    var myprod=await HttpServiceProducts.fetchproducts();
    if(myprod != null){
      productcart.value=myprod;
    }
  }
  catch(e){
  print(e);
  }finally{
    isLoading(false);
  }

}
}
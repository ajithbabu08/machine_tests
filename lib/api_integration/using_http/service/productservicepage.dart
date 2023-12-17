import '../model/productsmodel.dart';
import 'package:http/http.dart'as http;

class HttpServiceProducts{
static Future<List<MyProducts>> fetchproducts()async{
var response=await http.get(Uri.parse("https://fakestoreapi.com/products"));
if(response.statusCode==200){
var mydata=response.body;
return myProductsFromJson(mydata);
}
else
  {
    throw(Exception);
  }
}
}
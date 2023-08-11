import 'package:dio/dio.dart';

var dio = Dio();

Future<List> GetAllProduct(search) async {
  try {
    var response = await dio.get(
      'https://dummyjson.com/products/search?q=$search',
    );
    print('Status Code ${response.statusCode}');
    // print('${response.data}');
    var productlist = response.data;
    var onlyproducts = [];
    onlyproducts = productlist['products'];
    // print('only     ${onlyproducts}');
    return onlyproducts;
  } catch (e) {
    print(e);
    rethrow;
  }
}

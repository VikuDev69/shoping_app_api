import 'package:dio/dio.dart';

var dio = Dio();

Future<Map<String, dynamic>> GetSingleProduct(String id) async {
  try {
    var response = await dio.get(
      'https://dummyjson.com/products/$id',
    );
    print('Status Code ${response.statusCode}');
    // print('${response.data}');
    var singleProduct = response.data;
    print(singleProduct);

    print(singleProduct);
    return singleProduct;
  } catch (e) {
    print(e);
    rethrow;
  }
}

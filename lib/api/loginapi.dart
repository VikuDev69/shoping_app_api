import 'package:dio/dio.dart';

var dio = Dio();

Future<List> loginapi() async {
  try {
    var response = await dio.post('https://dummyjson.com/auth/login',
        data: {'username': 'kminchelle', 'password': "0lelplR"});

    var data = response.data;
    var datalist = [];
    datalist.add(data);
    print(datalist);
    return datalist;
  } catch (e) {
    print(e);
    throw Exception();
  }
}

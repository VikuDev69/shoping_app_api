import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shoping/api/loginapi.dart';

import '../../api/getallproduct.dart';

class Controller extends GetxController {
  var productlist = [].obs;
  var userinfo = [].obs;
  TextEditingController searchController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  void onInit() {
    getting();
    getUser();
    // getalldata(searchController.text);
    super.onInit();
  }

  void getting() async {
    await getalldata(searchController.text);
  }

  void getUser() async {
    await login();
  }

  Future<void> getalldata(search) async {
    var datalist = await GetAllProduct(search);
    if (datalist.isNotEmpty) {
      productlist.value = datalist;
      update();
    }
  }

  Future<void> login() async {
    var userdata = await loginapi();
    if (userdata.isNotEmpty) {
      userinfo.value = userdata;
      update();
    }
  }
}

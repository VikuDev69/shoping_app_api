import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../api/getsingleproduct.dart';
import '../single_product.dart';
import 'controller.dart';

class NewProductPage extends StatelessWidget {
  const NewProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(200, 150),
          child: AppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.black,
            elevation: 5,
            title: Column(
              children: [
                const Text(
                  " new  Products",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(hintText: 'search here'),
                    controller: controller.searchController,
                    onChanged: (value) {
                      controller.getalldata(value);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        body: Obx(
          () => controller.productlist.isEmpty
              ? Center(
                  child: SizedBox(
                    width: 200.0,
                    height: 100.0,
                    child: Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: Colors.grey.shade600,
                      child: const Text(
                        'Loading...... ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.55,
                  ),
                  itemCount: controller.productlist.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Flex(
                    direction: Axis.vertical,
                    children: [
                      InkWell(
                        onTap: () async {
                          String itemId =
                              controller.productlist[index]["id"].toString();
                          Map<String, dynamic>? singleP =
                              await GetSingleProduct(itemId);
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SingleProject(singleProduct: singleP)),
                            //if you want to disable back feature set to false
                          );
                        },
                        child: Flex(
                          direction: Axis.vertical,

                          // padding: const EdgeInsets.only(
                          //     top: 10, bottom: 15, left: 5, right: 5),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 0, top: 0),
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: Image(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                controller.productlist[index]
                                                    ['thumbnail'])),
                                      ),
                                      Positioned(
                                        left: 5,
                                        top: 5,
                                        child: CircleAvatar(
                                          radius: 18,
                                          backgroundColor: Colors.amber,
                                          child: Text(
                                            "${controller.productlist[index]["discountPercentage"]}%",
                                            maxLines: 2,
                                            style: const TextStyle(
                                              fontSize: 8,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          right: 5,
                                          top: 5,
                                          child: CircleAvatar(
                                            radius: 18,
                                            backgroundColor: Colors.white,
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons
                                                      .favorite_border_outlined,
                                                  color: Colors.black,
                                                  size: 21,
                                                )),
                                          ))
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${controller.productlist[index]["brand"]}",
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                                Text(
                                  "${controller.productlist[index]["title"]}",
                                  maxLines: 2,
                                  softWrap: true,
                                ),
                                Text(
                                  "Rs.${controller.productlist[index]["price"]}",
                                  maxLines: 2,
                                  softWrap: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ));
  }
}

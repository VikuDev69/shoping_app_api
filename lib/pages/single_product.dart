import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SingleProject extends StatefulWidget {
  final Map<String, dynamic> singleProduct;
  const SingleProject({super.key, required this.singleProduct});

  @override
  State<SingleProject> createState() => _SingleProjectState();
}

class _SingleProjectState extends State<SingleProject> {
  @override
  void initState() {
    // GetSingleProduct("${widget.singleProduct}");
    // TODO: implement initState
    print('widget.singleProduct    ${widget.singleProduct}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(style: ButtonStyle()),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Back To Shoping",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ListView(
            children: <Widget>[
              Image(
                image: NetworkImage("${widget.singleProduct["thumbnail"]}"),
                fit: BoxFit.cover,
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                ),
                child: Text(
                  "${widget.singleProduct["brand"]}",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        const SizedBox(width: 20.0),
                        RatingBar.builder(
                          initialRating: widget.singleProduct["rating"],
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.green,
                          ),
                          onRatingUpdate: (rating) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: const Duration(milliseconds: 500),
                                content: Text("You Rated $rating Star")));
                          },
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          "${widget.singleProduct["rating"]} Stars",
                          style: TextStyle(color: Colors.grey, fontSize: 14.0),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "\u{20B9}${widget.singleProduct["price"]}",
                    style: TextStyle(color: Colors.red, fontSize: 20.0),
                  ),
                  const SizedBox(width: 20.0),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: const Text(
                  "Description",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Text(
                  "This Is The description which will come from api after api Integration...",
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                  child: MaterialButton(
                elevation: 0,
                color: Colors.deepOrange,
                onPressed: () {},
                child: const Padding(
                    child: const Text("Buy Now"),
                    padding: EdgeInsets.all(10.0)),
              )),
              Expanded(
                  child: MaterialButton(
                elevation: 0,
                color: Colors.grey,
                onPressed: () {},
                child: const Padding(
                    child: const Text("Add To Cart"),
                    padding: EdgeInsets.all(10.0)),
              )),
            ],
          )
        ],
      ),
    );

    //  FutureBuilder(
    //   future: GetSingleProduct("${widget.singleProduct}"),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return CircularProgressIndicator();
    //     } else if (snapshot.connectionState == ConnectionState.done) {
    //       return

    //     }
    //     return CircularProgressIndicator();
    //   },
    // );
  }
}

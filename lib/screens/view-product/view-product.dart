import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:matspar/models/Detail.dart';
import 'package:matspar/models/Product.dart';
import 'package:matspar/repos/data-provider.dart';
import 'package:matspar/screens/view-product/nutrition-list.dart';
import 'package:matspar/screens/view-product/review-list.dart';
import 'package:matspar/styles/text-styles.dart';
import 'package:matspar/utils/loading-screen.dart';
import 'package:matspar/utils/widgets.dart';

class ViewProduct extends StatefulWidget {
  final Product product;
  const ViewProduct({super.key, required this.product});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  bool isLoading = true;
  late final Detail productDetail;
  grabDetails() async {
    Detail detail =
        await ProductProvider().findDetails('/' + widget.product.slug);

    if (mounted) {
      setState(() {
        productDetail = detail;
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    grabDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.product.name,
          style: DamiText.appbarTitle,
        ),
      ),
      body: ListView(
        children: [
          AspectRatio(
              aspectRatio: 2 / 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://d1ax460061ulao.cloudfront.net/280x300/4/f/${widget.product.image}.jpg"),
                      onError: (exception, stackTrace) {
                        print("Image Load Error");
                      },
                    )),
              )),
          isLoading
              ? LoadingScreen()
              : Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productDetail.payload.name,
                        style: DamiText.appbarTitle,
                      ),
                      // Text(),
                      space(0, 10),
                      RatingBarIndicator(
                        rating: double.parse(productDetail.payload.rating),
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 30.0,
                        direction: Axis.horizontal,
                      ),
                      space(0, 10),
                      Text(
                        productDetail.payload.description,
                        style: DamiText.text,
                      ),
                      space(0, 15),
                      Text(
                        productDetail.payload.ingredients,
                        style: DamiText.text,
                      ),
                      space(0, 10),
                      Text(
                        "INFORMATION",
                        style: DamiText.appbarTitle,
                      ),
                      Row(
                        children: [
                          Text('Weight'),
                          Text(productDetail.payload.contentWeight),
                        ],
                      ),
                      space(0, 10),
                      Text(
                        "Nutritions",
                        style: DamiText.appbarTitle,
                      ),
                      nutritionList(productDetail),
                      // reviewList(productDetail),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}

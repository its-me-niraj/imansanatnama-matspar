import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:matspar/models/Product.dart';
import 'package:matspar/screens/view-product/view-product.dart';
import 'package:matspar/styles/text-styles.dart';

class BookmarkList extends StatefulWidget {
  final List<Product> products;
  const BookmarkList({super.key, required this.products});

  @override
  State<BookmarkList> createState() => _BookmarkListState();
}

class _BookmarkListState extends State<BookmarkList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: widget.products.length,
          itemBuilder: (context, i) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ViewProduct(product: widget.products[i])));
              },
              // minLeadingWidth: 120,
              leading: AspectRatio(
                aspectRatio: 2 / 2,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                        "https://d1ax460061ulao.cloudfront.net/280x300/4/f/${widget.products[i].image}.jpg"),
                    onError: (exception, stackTrace) {
                      print("Image Load Error");
                    },
                  )),
                ),
              ),
              title: Text(
                widget.products[i].name,
                style: DamiText.titleOne,
              ),
              subtitle: Text(
                widget.products[i].name,
                style: DamiText.text,
              ),
            );
          }),
    );
  }
}

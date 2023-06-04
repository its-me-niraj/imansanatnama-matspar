import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matspar/logic/cubit/bookmark_cubit.dart';
import 'package:matspar/models/Product.dart';
import 'package:matspar/screens/view-product/view-product.dart';
import 'package:matspar/styles/text-styles.dart';
import 'package:matspar/utils/widgets.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 5,
                      spreadRadius: 1),
                ]),
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://d1ax460061ulao.cloudfront.net/280x300/4/f/${widget.product.image}.jpg"),
                        onError: (exception, stackTrace) {
                          print("Image Load Error");
                        },
                      )),
                )),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        widget.product.name,
                        style: DamiText.titleOne,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      space(0, 5),
                      Text(
                        "${widget.product.brand} ${widget.product.weightPretty}",
                        style: DamiText.titleTwo,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      space(0, 10),
                      Text(
                        widget.product.medianPrice.toString(),
                        style: DamiText.text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ViewProduct(product: widget.product)));
                        },
                        child: const Text(
                          'View',
                        ),
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
          Container(
            child: IconButton(
              icon: Icon(
                Icons.favorite_outline,
              ),
              onPressed: () {
                context.read<BookmarkCubit>().addToBookmark(widget.product);
              },
            ),
          )
        ],
      ),
    );
  }
}

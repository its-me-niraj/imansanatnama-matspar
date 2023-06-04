import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:matspar/models/Product.dart';
import 'package:matspar/screens/home-widgets/product-card.dart';

class SearchResult extends StatefulWidget {
  final List<Product> searchResult;

  const SearchResult({super.key, required this.searchResult});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3.5,
        ),
        itemBuilder: (_, index) =>
            ProductCard(product: widget.searchResult[index]),
        itemCount: widget.searchResult.length,
      ),
    );
  }
}

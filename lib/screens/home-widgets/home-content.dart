import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:matspar/models/Product.dart';
import 'package:matspar/screens/home-widgets/product-card.dart';

class HomeContent extends StatefulWidget {
  final List<Product> products;
  const HomeContent({super.key, required this.products});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3.5,
        ),
        itemBuilder: (_, index) => ProductCard(product: widget.products[index]),
        itemCount: widget.products.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:matspar/models/Detail.dart';

Widget reviewList(Detail productDetail) {
  return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: productDetail.payload.reviews.length,
      itemBuilder: (context, i) {
        return ListTile(
          minVerticalPadding: 0,
          contentPadding: const EdgeInsets.all(0),
          title: Text(productDetail.payload.reviews[i]),
          // trailing: Text(productDetail
          // .payload.nutritionalValue.first.nutrients[i].value
          // .toString()),
        );
      });
}

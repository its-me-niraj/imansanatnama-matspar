import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matspar/models/Detail.dart';

Widget nutritionList(Detail productDetail) {
  return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: productDetail.payload.nutritionalValue.first.nutrients.length,
      itemBuilder: (context, i) {
        return ListTile(
          minVerticalPadding: 0,
          contentPadding: const EdgeInsets.all(0),
          title: Text(
              productDetail.payload.nutritionalValue.first.nutrients[i].type),
          trailing: Text(productDetail
              .payload.nutritionalValue.first.nutrients[i].value
              .toString()),
        );
      });
}

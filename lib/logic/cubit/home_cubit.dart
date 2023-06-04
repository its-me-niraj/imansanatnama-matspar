import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:matspar/models/Product.dart';
import 'package:matspar/repos/data-provider.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading()) {
    start();
  }

  start() async {
    try {
      var resp = await ProductProvider().start();
      if (resp.statusCode == 200) {
        var filteredJson = jsonDecode(resp.body)['payload']['promos'];
        List<Product> products = productFromJson(jsonEncode(filteredJson));
        emit(HomeLoaded(products: products));
      } else {
        emit(HomeError());
      }
    } catch (e) {
      print(e.toString());
      emit(NetworkError());
    }
  }
}

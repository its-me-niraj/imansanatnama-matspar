import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:matspar/models/Product.dart';
import 'package:matspar/repos/data-provider.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitiate());

  search(key) async {
    emit(Searching());
    // try {
    var resp = await ProductProvider().search(key);
    if (resp.statusCode == 200) {
      var filteredJson = jsonDecode(resp.body)['payload']['products'];
      List<Product> products = productFromJson(jsonEncode(filteredJson));
      emit(Searched(products: products));
    } else {
      emit(SearchError());
    }
    // } catch (e) {
    // print(e.toString());
    // emit(NetworkError());
    // }
  }

  done() {
    emit(SearchInitiate());
  }
}

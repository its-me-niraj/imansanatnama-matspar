import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:matspar/models/Product.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  BookmarkCubit() : super(BookmarkInitial()) {
    initiate();
  }

  initiate() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/bookmarks.json');
      String fileContent = await file.readAsString();
      List<Product> products = productFromJson(fileContent);
      emit(BookmarkLoaded(bookmarks: products));
    } catch (e) {
      emit(BookmarkLoaded(bookmarks: []));
    }
  }

  addToBookmark(Product product) async {
    if (state is BookmarkLoaded) {
      final currentState = state as BookmarkLoaded;
      final updatedBookmarks = List<Product>.from(currentState.bookmarks)
        ..add(product);
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/bookmarks.json');
      await file.writeAsString(productToJson(updatedBookmarks));
      emit(BookmarkLoaded(bookmarks: updatedBookmarks));
    }
  }
}

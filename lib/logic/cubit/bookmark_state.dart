part of 'bookmark_cubit.dart';

@immutable
abstract class BookmarkState {}

class BookmarkInitial extends BookmarkState {}

class BookmarkLoading extends BookmarkState {}

class BookmarkLoaded extends BookmarkState {
  final List<Product> bookmarks;

  BookmarkLoaded({required this.bookmarks});
}

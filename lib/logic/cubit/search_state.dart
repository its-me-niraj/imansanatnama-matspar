part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitiate extends SearchState {}

class Searching extends SearchState {}

class Searched extends SearchState {
  final List<Product> products;

  Searched({required this.products});
}

class SearchError extends SearchState {}

class NetworkError extends SearchState {}

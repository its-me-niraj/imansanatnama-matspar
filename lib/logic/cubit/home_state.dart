part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Product> products;
  HomeLoaded({required this.products});
}

class HomeError extends HomeState {}

class NetworkError extends HomeState {}

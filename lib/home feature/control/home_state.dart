import 'package:restaurant/home feature/data/restaurant_model.dart';

abstract class HomeState {
  const HomeState();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  final List<String> categories;
  final List<Restaurant> restaurants;
  final String selectedCategory;
  const HomeLoaded(this.categories, this.restaurants, this.selectedCategory);
}

class HomeFailure extends HomeState {
  final String message;
  const HomeFailure(this.message);
}

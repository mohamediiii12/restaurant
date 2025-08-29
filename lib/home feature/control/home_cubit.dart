import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';
import 'package:restaurant/home feature/data/product_model.dart';
import 'package:restaurant/home feature/data/home_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repository;

  HomeCubit(this.repository) : super(HomeLoading());

  void loadHomeData() async {
    emit(HomeLoading());
    try {
      final products = await repository.getProducts();
      emit(HomeLoaded(products));
    } catch (e) {
      emit(HomeError("Failed to load products"));
    }
  }
}

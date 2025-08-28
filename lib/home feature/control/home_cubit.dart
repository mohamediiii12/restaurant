import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/home feature/data/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repo;
  HomeCubit(this.repo) : super(const HomeLoading()) {
    load();
  }

  Future<void> load({String category = 'All'}) async {
    emit(const HomeLoading());
    try {
      final cats = await repo.fetchCategories();
      final restos = await repo.fetchRestaurants(category: category);
      emit(HomeLoaded(cats, restos, category));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

  void selectCategory(String c) => load(category: c);
}

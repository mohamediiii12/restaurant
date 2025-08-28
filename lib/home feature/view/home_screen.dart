import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/home feature/control/home_cubit.dart';
import 'package:restaurant/home feature/control/home_state.dart';
import 'package:restaurant/home feature/data/home_repository.dart';
import 'widgets/category_chip.dart';
import 'widgets/home_search_bar.dart';
import 'widgets/restaurant_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(HomeRepository()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Restaurants'),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag_outlined)),
            const SizedBox(width: 6),
          ],
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is HomeFailure) {
              return Center(child: Text(state.message));
            }
            final s = state as HomeLoaded;
            return RefreshIndicator(
              onRefresh: () =>
                  context.read<HomeCubit>().load(category: s.selectedCategory),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const SizedBox(height: 4),
                  const Text('Are you hungry ? Order now 🍔',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  HomeSearchBar(onChanged: (q) {}),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, i) {
                        final c = s.categories[i];
                        return CategoryChip(
                          label: c,
                          selected: c == s.selectedCategory,
                          onTap: () =>
                              context.read<HomeCubit>().selectCategory(c),
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemCount: s.categories.length,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...s.restaurants.map((r) => RestaurantCard(restaurant: r)),
                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

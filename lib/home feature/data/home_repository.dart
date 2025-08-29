import 'product_model.dart';

class HomeRepository {
  Future<List<ProductModel>> getProducts() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      ProductModel(
        id: "1",
        name: "Strawberry Cake",
        image: "https://picsum.photos/200/300?1",
        price: 10.0,
        bestSeller: true,
      ),
      ProductModel(
        id: "2",
        name: "Veggie Pizza",
        image: "https://picsum.photos/200/300?2",
        price: 12.5,
        bestSeller: true,
      ),
      ProductModel(
        id: "3",
        name: "Salad Bowl",
        image: "https://picsum.photos/200/300?3",
        price: 8.2,
      ),
      ProductModel(
        id: "4",
        name: "Burger",
        image: "https://picsum.photos/200/300?4",
        price: 9.5,
      ),
    ];
  }
}

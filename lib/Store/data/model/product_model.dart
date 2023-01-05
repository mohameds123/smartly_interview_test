
import 'package:movies/Store/domain/entities/produts.dart';

class ProductModel extends Products {
  ProductModel(
      {required int id,
      required double price,
      required String title,
      required String description,
      required String category,
      required String image})
      : super(
            id: id,
            price: price,
            title: title,
            description: description,
            category: category,
            image: image);

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        price: json['price'].toDouble(),
        title: json['title'],
        description: json['description'],
        image: json['image'],
        category: json['category'],
      );
}

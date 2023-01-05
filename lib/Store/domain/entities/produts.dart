import 'package:equatable/equatable.dart';

 class Products extends Equatable {
  final int id;
  final double price;
  final String title;
  final String description;
  final String category;
  final String image;


  const Products({
    required this.id,
    required this.price,
    required this.title,
    required  this.description,
    required this.category,
    required this.image,

  });

  @override
  List<Object> get props=>[
    id,
    price,
    title,
    description,
    category,
    image,
  ];
}
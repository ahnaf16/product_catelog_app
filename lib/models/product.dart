import 'package:dart_mappable/dart_mappable.dart';

part 'product.mapper.dart';

@MappableClass()
class Product with ProductMappable {
  static const fromMap = ProductMapper.fromMap;
  static const fromJson = ProductMapper.fromJson;

  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
}

@MappableClass()
class Rating with RatingMappable {
  static const fromMap = RatingMapper.fromMap;
  static const fromJson = RatingMapper.fromJson;

  final num rate;
  final int count;

  const Rating({required this.rate, required this.count});
}

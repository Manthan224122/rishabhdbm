import 'package:dio/dio.dart';
import '../models/product.dart';

class ProductRepository {
  final Dio _dio = Dio();

  Future<List<Product>> getProducts() async {
    const url = 'https://fakestoreapi.com/products';
    try {
      final response = await _dio.get(url);
      return (response.data as List)
          .map((item) => Product.fromJson(item))
          .toList();
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }
}

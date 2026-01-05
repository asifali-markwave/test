import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/models/product.dart';

final productsProvider = Provider<List<Product>>((ref) {
  return [
    const Product(
      id: '1',
      name: 'Stylish T-Shirt',
      price: 29.99,
      imageUrl: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1180&q=80',
    ),
    const Product(
      id: '2',
      name: 'Classic Jeans',
      price: 79.99,
      imageUrl: 'https://images.unsplash.com/photo-1602293589930-45a9de87e82b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
    ),
    const Product(
      id: '3',
      name: 'Comfy Hoodie',
      price: 49.99,
      imageUrl: 'https://images.unsplash.com/photo-1556821855-33a2ba56ea7a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1004&q=80',
    ),
     const Product(
      id: '4',
      name: 'Leather Jacket',
      price: 129.99,
      imageUrl: 'https://images.unsplash.com/photo-1543169903-7a2b27a3a165?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
    ),
  ];
});

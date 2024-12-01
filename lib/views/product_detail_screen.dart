import 'package:flutter/material.dart';
import '../data/models/product.dart';
import '../widgets/appbarFloatingButton.dart';
import '../widgets/bottom_nav_bar.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(product.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),),
        backgroundColor: Colors.green,
        scrolledUnderElevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.green,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0),),
          child: Container(
            padding: EdgeInsets.only(top: 10),
            color: Colors.grey[100],
            child: Column(
              children: [
                Hero(
                  tag: 'product-${product.id}',
                  child: Image.network(product.image, height: 250, fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(product.title, style: const TextStyle(fontSize: 20)),
                      Text('\$${product.price}', style: const TextStyle(color: Colors.green)),
                      const SizedBox(height: 20),
                      Text(product.description),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: appbarFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';
import '../views/product_detail_screen.dart';
import '../widgets/appbarFloatingButton.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/product_card.dart';

class CategoryScreen extends StatelessWidget {
  final String category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.find();

    final filteredProducts = controller.products
        .where((product) => product.category == category)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Colors.green,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0),),
          child: Container(
            padding: EdgeInsets.only(top: 10),
            color: Colors.grey[100],
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: filteredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Get.to(() => ProductDetailScreen(product: filteredProducts[index])),
                  child: ProductCard(product: filteredProducts[index]),
                );
              },
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

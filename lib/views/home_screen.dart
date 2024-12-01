import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_searchbar/new/standard_search_anchor.dart';
import 'package:standard_searchbar/new/standard_search_bar.dart';
import 'package:standard_searchbar/new/standard_suggestion.dart';
import 'package:standard_searchbar/new/standard_suggestions.dart';
import '../controllers/product_controller.dart';
import '../views/category_screen.dart';
import '../widgets/appbarFloatingButton.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/category_card.dart';
import '../widgets/product_card.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hey 🙂 \nLets search your grocery food.',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),),
        backgroundColor: Colors.green,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            icon: Image.asset("assets/images/profile_pic.png", width: 60, height: 60,),
            onPressed: () {
              //Get.to(profileScreen());
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container(
          color: Colors.green,
          child: Column(
            children: [

              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: StandardSearchAnchor(
                  searchBar: StandardSearchBar(
                    height: 45,
                    borderRadius: 10,
                    bgColor: Colors.white,
                  ),
                  suggestions: StandardSuggestions(
                    suggestions: [
                      StandardSuggestion(text: 'Search1'),
                      StandardSuggestion(text: 'Search2'),
                      StandardSuggestion(text: 'Search3'),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0),),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.grey[100],
                    child: ListView(
                      children: [
                        SizedBox(height: 10,),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Categories', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700)),
                                ),
                          
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: controller.categories
                                        .map((category) => GestureDetector(
                                      onTap: () => Get.to(() => CategoryScreen(category: category)),
                                      child: CategoryCard(category: category),
                                    ))
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 15,),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Popular Products', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700)),
                                ),
                            
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.products.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5,
                                  ),
                                  itemBuilder: (context, index) {
                                    return ProductCard(product: controller.products[index]);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: appbarFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

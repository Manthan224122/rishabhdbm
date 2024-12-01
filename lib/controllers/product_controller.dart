import 'package:get/get.dart';
import '../data/models/product.dart';
import '../data/views/product_repository.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var products = <Product>[].obs;
  var categories = <String>[].obs;

  final ProductRepository _repository = ProductRepository();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var fetchedProducts = await _repository.getProducts();
      if (fetchedProducts != null) {
        products.assignAll(fetchedProducts);

        // Extract unique categories
        categories.assignAll(
          fetchedProducts.map((product) => product.category).toSet().toList(),
        );
      }
    } finally {
      isLoading(false);
    }
  }
}

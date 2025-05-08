import 'dart:developer';

import 'package:get/get.dart';
import '../model/product_model.dart';
import '../service/api_service.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var filteredProducts = <Product>[].obs;
  var isLoading = false.obs;

  var favProducts = <Product>[].obs;
  var filteredFavProducts = <Product>[].obs;

  var selectedProduct = Rxn<Product>();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    isLoading.value = true;
    try {
      final response = await ApiService.getRequest('products');
      if (response['success'] == true) {
        final List<dynamic> data = response['data']['products'];
        final List<Product> loadedProducts =
            data.map((json) => Product.fromJson(json)).toList();

        products.assignAll(loadedProducts);
        filteredProducts.assignAll(loadedProducts);
      } else {
        products.clear();
        filteredProducts.clear();
      }
    } finally {
      isLoading.value = false;
    }
  }

  void fetchProductDetails(String id) async {
    isLoading.value = true;
    try {
      final response = await ApiService.getRequest('products/$id');
      if (response['success'] == true) {
        final dynamic json = response['data'];
        selectedProduct.value = Product.fromJson(json ?? {});
      } else {
        selectedProduct.value = null;
      }
    } catch (e) {
      log('Error fetching product details: $e');
      selectedProduct.value = null;
    } finally {
      isLoading.value = false;
    }
  }

  void toggleFavorite(Product product) {
    if (isFavorite(product)) {
      favProducts.removeWhere((p) => p.id == product.id);
    } else {
      favProducts.add(product);
    }
    searchFavoriteProducts('');
  }

  bool isFavorite(Product product) {
    return favProducts.any((p) => p.id == product.id);
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      filteredProducts.assignAll(products);
    } else {
      final searchLower = query.toLowerCase();
      final result =
          products.where((product) {
            final titleLower = product.title.toLowerCase();
            final categoryLower = product.category.toLowerCase();
            return titleLower.contains(searchLower) ||
                categoryLower.contains(searchLower);
          }).toList();

      filteredProducts.assignAll(result);
    }
  }

  void searchFavoriteProducts(String query) {
    if (query.isEmpty) {
      filteredFavProducts.assignAll(favProducts);
    } else {
      final searchLower = query.toLowerCase();
      final result =
          favProducts.where((product) {
            final titleLower = product.title.toLowerCase();
            final categoryLower = product.category.toLowerCase();
            return titleLower.contains(searchLower) ||
                categoryLower.contains(searchLower);
          }).toList();

      filteredFavProducts.assignAll(result);
    }
  }
}

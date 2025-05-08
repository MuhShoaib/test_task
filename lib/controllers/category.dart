import 'dart:developer';
import 'package:get/get.dart';
import '../model/category_model.dart';
import '../model/product_model.dart';
import '../service/api_service.dart';

class CategoryController extends GetxController {
  var category = <CategoryModel>[].obs;
  var filteredCategory = <CategoryModel>[].obs;
  var products = <Product>[].obs;
  var filteredProducts = <Product>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategory();
  }

  // Fetch all categories
  void fetchCategory() async {
    isLoading.value = true;
    try {
      final response = await ApiService.getRequest('products/categories');
      log(response.toString());

      if (response['success'] == true) {
        final List<dynamic> data = response['data'];
        final List<CategoryModel> loadedCategories =
            data.map((json) => CategoryModel.fromJson(json)).toList();

        category.assignAll(loadedCategories);
        filteredCategory.assignAll(loadedCategories);
      } else {
        category.clear();
        filteredCategory.clear();
      }
    } finally {
      isLoading.value = false;
    }
  }

  void fetchProductsByCategory(String category) async {
    isLoading.value = true;
    try {
      final response = await ApiService.getRequest(
        'products/category/$category',
      );
      log(response.toString());

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

  void searchCategories(String query) {
    if (query.isEmpty) {
      filteredCategory.assignAll(category);
    } else {
      final result =
          category.where((cat) {
            final nameLower = cat.name.toLowerCase();
            final slugLower = cat.slug.toLowerCase();
            final searchLower = query.toLowerCase();

            return nameLower.contains(searchLower) ||
                slugLower.contains(searchLower);
          }).toList();

      filteredCategory.assignAll(result);
    }
  }

  void searchProductsByCategory(String query) {
    if (query.isEmpty) {
      filteredProducts.assignAll(products);
    } else {
      final result =
          products.where((prod) {
            final titleLower = prod.title.toLowerCase();
            final descLower = prod.description.toLowerCase();
            final searchLower = query.toLowerCase();

            return titleLower.contains(searchLower) ||
                descLower.contains(searchLower);
          }).toList();

      filteredProducts.assignAll(result);
    }
  }
}

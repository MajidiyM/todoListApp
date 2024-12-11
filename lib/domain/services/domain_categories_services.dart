import '../models/category_model/category.dart';

abstract class CategoriesService {
  Future<List<Category>> getCategories();
}

import 'package:sublet/models/category/category_response.dart';

import '../models/category/sub_category_response.dart';
import '../utils/constants/api_container.dart';

class CategoryController {
  final CategoryResponse model = CategoryResponse();
  final SubCategoryResponse modelSubCategory = SubCategoryResponse();

  Future<List<CategoryList>> getCategories() {
    return model.fetchCategories(KApiEndPoints.CATEGORY_LIST);
  }

  Future<List<SubCategoryList>> getSubCategories(String categoryId) {
    return modelSubCategory.fetchSubCategories(KApiEndPoints.SUB_CATEGORY_LIST + categoryId);
  }

}
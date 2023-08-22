import 'package:trolley/models/product/product_model.dart';

class SubCategoryModel {
  final String categoryTitle;
  final List<SubCategoriesTab> subCategoryTab;

  const SubCategoryModel({
    this.categoryTitle = '',
    this.subCategoryTab = const [],
  });
}

class SubCategoriesTab {
  final String title;
  final String imgUrl;
  final List<ProductModel> productList;

  SubCategoriesTab({
    this.imgUrl = '',
    this.title = '',
    this.productList = const [],
  });
}

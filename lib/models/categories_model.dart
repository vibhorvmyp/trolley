import 'package:trolley/models/product/product_model.dart';
import 'package:trolley/models/sub_categories/sub_categories_model.dart';

class CategoriesModel {
  final String title;
  final String imgUrl;
  final SubCategoryModel subCategoryModel;

  const CategoriesModel(
      {this.imgUrl = '',
      this.title = '',
      this.subCategoryModel = const SubCategoryModel()});

  static List<CategoriesModel> categoriesList = [
    CategoriesModel(
      title: 'Drinks',
      imgUrl: 'assets/images/categories/drinks.png',
      subCategoryModel: SubCategoryModel(
        categoryTitle: 'Grocery',
        subCategoryTab: [
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
        ],
      ),
    ),
    CategoriesModel(
      title: 'Grocery',
      imgUrl: 'assets/images/categories/grocery.png',
      subCategoryModel: SubCategoryModel(
        categoryTitle: 'Grocery',
        subCategoryTab: [
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
        ],
      ),
    ),
    CategoriesModel(
      title: 'Meats & Chickens',
      imgUrl: 'assets/images/categories/chicken.png',
      subCategoryModel: SubCategoryModel(
        categoryTitle: 'Grocery',
        subCategoryTab: [
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
        ],
      ),
    ),
    CategoriesModel(
      title: 'Bathing Essentials',
      imgUrl: 'assets/images/categories/bathing.png',
      subCategoryModel: SubCategoryModel(
        categoryTitle: 'Grocery',
        subCategoryTab: [
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
        ],
      ),
    ),
    CategoriesModel(
      title: 'Biscuits & Cookies',
      imgUrl: 'assets/images/categories/cookies.png',
      subCategoryModel: SubCategoryModel(
        categoryTitle: 'Biscuits & Cookies',
        subCategoryTab: [
          SubCategoriesTab(
              title: 'Creamfills',
              imgUrl: 'assets/images/sub_categories/biscuits/creamfills.png',
              productList: ProductModel.productListCreamfillsBiscuits),
          SubCategoriesTab(
              title: 'Cookies',
              imgUrl: 'assets/images/sub_categories/biscuits/cookies.png',
              productList: ProductModel.productListCookiesBiscuits),
          SubCategoriesTab(
            title: 'Glucose',
            imgUrl: 'assets/images/sub_categories/biscuits/glucose.png',
            productList: ProductModel.productListGlucoseBiscuits,
          ),
          SubCategoriesTab(
            title: 'Wafers',
            imgUrl: 'assets/images/sub_categories/biscuits/wafers.png',
            productList: ProductModel.productListGlucoseBiscuits,
          ),
          SubCategoriesTab(
            title: 'Rusk',
            imgUrl: 'assets/images/sub_categories/biscuits/rusk.png',
            productList: ProductModel.productListGlucoseBiscuits,
          ),
          SubCategoriesTab(
            title: 'Digestives',
            imgUrl: 'assets/images/sub_categories/biscuits/digestives.png',
            productList: ProductModel.productListGlucoseBiscuits,
          ),
          SubCategoriesTab(
            title: 'Combos',
            imgUrl: 'assets/images/sub_categories/biscuits/combos.png',
            productList: ProductModel.productListGlucoseBiscuits,
          ),
          SubCategoriesTab(
            title: 'Creamfills',
            imgUrl: 'assets/images/sub_categories/biscuits/creamfills.png',
            productList: ProductModel.productListGlucoseBiscuits,
          ),
          SubCategoriesTab(
            title: 'Creamfills',
            imgUrl: 'assets/images/sub_categories/biscuits/creamfills.png',
            productList: ProductModel.productListGlucoseBiscuits,
          ),
          SubCategoriesTab(
            title: 'Creamfills',
            imgUrl: 'assets/images/sub_categories/biscuits/creamfills.png',
            productList: ProductModel.productListGlucoseBiscuits,
          ),
          SubCategoriesTab(
            title: 'Creamfills',
            imgUrl: 'assets/images/sub_categories/biscuits/creamfills.png',
            productList: ProductModel.productListGlucoseBiscuits,
          ),
          SubCategoriesTab(
            title: 'Creamfills',
            imgUrl: 'assets/images/sub_categories/biscuits/creamfills.png',
            productList: ProductModel.productListGlucoseBiscuits,
          ),
          SubCategoriesTab(
            title: 'Creamfills',
            imgUrl: 'assets/images/sub_categories/biscuits/creamfills.png',
            productList: ProductModel.productListGlucoseBiscuits,
          ),
          SubCategoriesTab(
            title: 'Creamfills',
            imgUrl: 'assets/images/sub_categories/biscuits/creamfills.png',
            productList: ProductModel.productListGlucoseBiscuits,
          ),
          SubCategoriesTab(
            title: 'Creamfills',
            imgUrl: 'assets/images/sub_categories/biscuits/creamfills.png',
            productList: ProductModel.productListGlucoseBiscuits,
          ),
          SubCategoriesTab(
            title: 'Creamfills',
            imgUrl: 'assets/images/sub_categories/biscuits/creamfills.png',
            productList: ProductModel.productListGlucoseBiscuits,
          ),
        ],
      ),
    ),
    CategoriesModel(
      title: 'Snacks',
      imgUrl: 'assets/images/categories/snacks.png',
      subCategoryModel: SubCategoryModel(
        categoryTitle: 'Grocery',
        subCategoryTab: [
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
        ],
      ),
    ),
    CategoriesModel(
      title: 'Makeup & Beauty',
      imgUrl: 'assets/images/categories/makeup_beauty.png',
      subCategoryModel: SubCategoryModel(
        categoryTitle: 'Grocery',
        subCategoryTab: [
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
        ],
      ),
    ),
    CategoriesModel(
      title: 'Dairy Products',
      imgUrl: 'assets/images/categories/dairy.png',
      subCategoryModel: SubCategoryModel(
        categoryTitle: 'Grocery',
        subCategoryTab: [
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
        ],
      ),
    ),
    CategoriesModel(
      title: 'Cleaning Essentials',
      imgUrl: 'assets/images/categories/cleaning.png',
      subCategoryModel: SubCategoryModel(
        categoryTitle: 'Grocery',
        subCategoryTab: [
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
        ],
      ),
    ),
    CategoriesModel(
      title: 'Bathing Essentials',
      imgUrl: 'assets/images/categories/bathing.png',
      subCategoryModel: SubCategoryModel(
        categoryTitle: 'Grocery',
        subCategoryTab: [
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
        ],
      ),
    ),
    CategoriesModel(
      title: 'Biscuits & Cookies',
      imgUrl: 'assets/images/categories/cookies.png',
      subCategoryModel: SubCategoryModel(
        categoryTitle: 'Grocery',
        subCategoryTab: [
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
        ],
      ),
    ),
    CategoriesModel(
      title: 'Snacks',
      imgUrl: 'assets/images/categories/snacks.png',
      subCategoryModel: SubCategoryModel(
        categoryTitle: 'Grocery',
        subCategoryTab: [
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/vegtables.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Leafy & Herbs',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Fresh Cuts',
              imgUrl: 'assets/images/sub_categories/herbs.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Dry Fruits',
              imgUrl: 'assets/images/sub_categories/fresh.png',
              productList: ProductModel.productListSeasonal),
          SubCategoriesTab(
              title: 'Seasonal',
              imgUrl: 'assets/images/sub_categories/dry_fruits.png',
              productList: ProductModel.productListFreshVeggies),
          SubCategoriesTab(
              title: 'Fresh Vegetables',
              imgUrl: 'assets/images/sub_categories/seasonal.png',
              productList: ProductModel.productListFreshVeggies),
        ],
      ),
    ),
  ];

  static List<CategoriesModel> buyAgainCategoriesList = [
    CategoriesModel(
      title: 'All',
      imgUrl: 'assets/images/buy_again/all.png',
      subCategoryModel: SubCategoryModel(
        categoryTitle: 'All',
        subCategoryTab: [
          SubCategoriesTab(
              title: 'All',
              imgUrl: 'assets/images/buy_again/all.png',
              productList: ProductModel.productListFreshVeggies),
        ],
      ),
    ),
    CategoriesModel(
      title: 'Meats & Chickens',
      imgUrl: 'assets/images/buy_again/meats.png',
      subCategoryModel: SubCategoryModel(
        categoryTitle: 'Meats & Chickens',
        subCategoryTab: [
          SubCategoriesTab(
              title: 'Meats & Chickens',
              imgUrl: 'assets/images/buy_again/meats.png',
              productList: ProductModel.productListSeasonal),
        ],
      ),
    ),
    CategoriesModel(
      title: 'Cookies & Biscuits',
      imgUrl: 'assets/images/buy_again/cookies.png',
      subCategoryModel: SubCategoryModel(
        categoryTitle: 'Cookies & Biscuits',
        subCategoryTab: [
          SubCategoriesTab(
              title: 'Cookies & Biscuits',
              imgUrl: 'assets/images/buy_again/cookies.png',
              productList: ProductModel.productListCookiesBiscuits),
        ],
      ),
    ),
    CategoriesModel(
      title: 'Dairy Products',
      imgUrl: 'assets/images/buy_again/dairy.png',
      subCategoryModel: SubCategoryModel(
        categoryTitle: 'Dairy Products',
        subCategoryTab: [
          SubCategoriesTab(
              title: 'Dairy Products',
              imgUrl: 'assets/images/buy_again/dairy.png',
              productList: ProductModel.productListFreshVeggies),
        ],
      ),
    ),
    CategoriesModel(
      title: 'Snacks',
      imgUrl: 'assets/images/buy_again/snacks.png',
      subCategoryModel: SubCategoryModel(
        categoryTitle: 'Snacks',
        subCategoryTab: [
          SubCategoriesTab(
              title: 'Snacks',
              imgUrl: 'assets/images/buy_again/snacks.png',
              productList: ProductModel.productListCreamfillsBiscuits),
        ],
      ),
    ),
    CategoriesModel(
      title: 'Meats & Chicken',
      imgUrl: 'assets/images/buy_again/meats.png',
      subCategoryModel: SubCategoryModel(
        categoryTitle: 'Meats & Chicken',
        subCategoryTab: [
          SubCategoriesTab(
              title: 'Meats & Chicken',
              imgUrl: 'assets/images/buy_again/meats.png',
              productList: ProductModel.productListGlucoseBiscuits),
        ],
      ),
    ),
  ];
}

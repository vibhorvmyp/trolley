// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartDataModel {
  final String imgUrl;
  final String title;
  final String weight;
  final String originalPrice;
  final String discountedPrice;
  final String offPercentage;
  CartDataModel({
    this.imgUrl = '',
    this.title = '',
    this.weight = '',
    this.originalPrice = '',
    this.discountedPrice = '',
    this.offPercentage = '',
  });

  static List<CartDataModel> youMayAlsoLikeList = [
    CartDataModel(
        imgUrl: 'assets/images/home/carrots.png',
        title: 'Orange Carrot',
        weight: '500',
        originalPrice: '199.45',
        discountedPrice: '99.45',
        offPercentage: '15'),
    CartDataModel(
        imgUrl: 'assets/images/home/cakes.png',
        title: 'Brown Cookies',
        weight: '500',
        originalPrice: '199.45',
        discountedPrice: '99.45',
        offPercentage: '15'),
    CartDataModel(
        imgUrl: 'assets/images/home/carrots.png',
        title: 'Orange Carrot',
        weight: '500',
        originalPrice: '199.45',
        discountedPrice: '99.45',
        offPercentage: '15'),
    CartDataModel(
        imgUrl: 'assets/images/home/cakes.png',
        title: 'Brown Cookies',
        weight: '500',
        originalPrice: '199.45',
        discountedPrice: '99.45',
        offPercentage: '15'),
  ];
}

import 'package:get/get.dart';
import 'package:trolley/models/product/product_model.dart';

class CancelOrderController extends GetxController {
  final RxList selectedItemsList = [].obs;
  final List<ProductModel> cancelOrderItemsStaticList = [
    const ProductModel(
      title: 'Mango Alphonso',
      id: 1,
      weight: '6 pcs (Approx 1.2kg)',
      originalPrice: '200',
      discountedPrice: '100',
      currency: 'SDG',
      imgUrl: 'assets/images/orders/mango.png',
    ),
    const ProductModel(
      title: 'Orange Carrot',
      id: 2,
      weight: '6 pcs (Approx 1.2kg)',
      originalPrice: '200',
      discountedPrice: '100',
      currency: 'SDG',
      imgUrl: 'assets/images/orders/carrot.png',
    ),
  ];

  addAllIds() {
    for (var product in cancelOrderItemsStaticList) {
      if (!selectedItemsList.contains(product.id)) {
        selectedItemsList.add(product.id);
      }
    }
  }

  removeAllIds() {
    selectedItemsList.clear();
  }

  addOrRemoveId(int id) {
    if (selectedItemsList.contains(id)) {
      selectedItemsList.remove(id);
    } else {
      selectedItemsList.add(id);
    }
  }
}

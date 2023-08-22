// ignore_for_file: public_member_api_docs, sort_constructors_first
class Order {
  final String orderId;
  final String orderStatus;
  final String itemCount;
  final String itemsTitle;
  final String orderTime;
  final String totalSum;
  final String buttonTitle;
  final List<String> itemsListImgUrl;
  final bool ratingFlag;

  Order({
    this.orderId = '',
    this.orderStatus = '',
    this.itemCount = '',
    this.itemsTitle = '',
    this.orderTime = '',
    this.totalSum = '',
    this.buttonTitle = '',
    this.itemsListImgUrl = const [],
    this.ratingFlag = false,
  });

  static List<Order> ordersList = [
    Order(
      orderId: '#TROLL12345',
      orderStatus: 'On the way',
      itemCount: '2',
      itemsTitle: 'Mango Alphonso, Orange Carrot',
      orderTime: '20th May 2023, 11:30 am',
      totalSum: '198.90',
      buttonTitle: 'Cancel Order',
      itemsListImgUrl: [
        'assets/images/orders/mango.png',
        'assets/images/orders/carrot.png'
      ],
      ratingFlag: false,
    ),
    Order(
      orderId: '#TROLL12345',
      orderStatus: 'Delivered',
      itemCount: '2',
      itemsTitle: 'Mango Alphonso, Orange Carrot',
      orderTime: '19th May 2023, 11:30 am',
      totalSum: '198.90',
      buttonTitle: 'Reorder',
      itemsListImgUrl: [
        'assets/images/orders/mango.png',
        'assets/images/orders/carrot.png'
      ],
      ratingFlag: true,
    ),
    Order(
      orderId: '#TROLL12349',
      orderStatus: 'Cancelled',
      itemCount: '2',
      itemsTitle: 'Mango Alphonso, Orange Carrot',
      orderTime: '10th May 2023, 11:30 am',
      totalSum: '120.90',
      buttonTitle: 'Reorder',
      itemsListImgUrl: [
        'assets/images/orders/mango.png',
        'assets/images/orders/carrot.png'
      ],
      ratingFlag: false,
    ),
  ];
}

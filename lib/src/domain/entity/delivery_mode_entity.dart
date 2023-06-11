class DeliveryModeEntity {
  final String deliveryMode;
  final String imageUrl;
  final int price;

  DeliveryModeEntity(
      {required this.price,
      required this.deliveryMode,
      required this.imageUrl});
}

List<DeliveryModeEntity> deliveryModeList = [
  DeliveryModeEntity(
      deliveryMode: 'Drive-Thru', imageUrl: 'assets/drivethru.png', price: 500),
  DeliveryModeEntity(
      deliveryMode: 'Home Delivery',
      imageUrl: 'assets/home_delivery.png',
      price: 2000)
];

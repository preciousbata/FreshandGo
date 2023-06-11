class FruitJuiceEntity {
  String imageUrl;
  String juiceName;
  int amount;

  FruitJuiceEntity({
    required this.imageUrl,
    required this.juiceName,
    required this.amount,
  });

  factory FruitJuiceEntity.fromJson(Map<String, dynamic> json) =>
      FruitJuiceEntity(
        imageUrl: json["imageUrl"],
        juiceName: json["juiceName"],
        amount: json["amount"],
      );
}

List<FruitJuiceEntity> fruitJuice = [
  FruitJuiceEntity(
      imageUrl: 'assets/oranges.jpeg', juiceName: 'Orange', amount: 2000),
  FruitJuiceEntity(
      imageUrl: 'assets/apple.jpeg', juiceName: 'Apple', amount: 2500),
  FruitJuiceEntity(
      imageUrl: 'assets/mango.jpeg', juiceName: 'Mango', amount: 2500),
  FruitJuiceEntity(
      imageUrl: 'assets/pineapple.jpeg', juiceName: 'PineApple', amount: 2500),
  FruitJuiceEntity(
      imageUrl: 'assets/strawberry.jpeg',
      juiceName: 'StrawBerry',
      amount: 3000),
  FruitJuiceEntity(
      imageUrl: 'assets/watermelon.jpeg',
      juiceName: 'WaterMelon',
      amount: 3000),
  FruitJuiceEntity(
      imageUrl: 'assets/grape.jpeg', juiceName: 'Grape', amount: 3200),
  FruitJuiceEntity(
      imageUrl: 'assets/blueberry.jpeg', juiceName: 'BlueBerry', amount: 3200),
  FruitJuiceEntity(
      imageUrl: 'assets/kiwi.jpeg', juiceName: 'Kiwi', amount: 3200),
  FruitJuiceEntity(
      imageUrl: 'assets/lemon_lime.jpeg', juiceName: 'Lemon', amount: 3200),
];

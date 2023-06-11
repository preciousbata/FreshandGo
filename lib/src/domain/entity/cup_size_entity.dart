class CupSizeEntity {
  final String size;
  final String imageUrl;
  final int price;

  CupSizeEntity(
      {required this.price, required this.size, required this.imageUrl});
}

List<CupSizeEntity> cupSizeList = [
  CupSizeEntity(size: 'S', imageUrl: 'assets/small cup.png', price: 0),
  CupSizeEntity(size: 'M', imageUrl: 'assets/medium cup.png', price: 500),
  CupSizeEntity(size: 'L', imageUrl: 'assets/large cup.png', price: 700),
];

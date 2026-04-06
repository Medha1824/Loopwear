class Product {
  final String id;
  final String title;
  final String category;
  final String image1;
  final String image2;
  final String image3;
  final String description;
  final String price;
  final String? beforeSale;

  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.description,
    required this.price,
    this.beforeSale,
  });


  List<String> get images => [image1, image2, image3];
}
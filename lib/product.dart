class Product {
  final String title;
  final String category;
  final String image1;
  final String image2;
  final String image3;
  final String description;
  final String price;

  Product({
    required this.title,
    required this.category,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.description,
    required this.price,
  });


  List<String> get images => [image1, image2, image3];
}
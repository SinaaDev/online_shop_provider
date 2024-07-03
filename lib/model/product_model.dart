class ProductModel{
  final String image;
  final String name;
  final String price;
  final String description;
  bool favorite;

  ProductModel(
      {
        required this.image,
        required this.name,
        required this.price,
        required this.description,
        this.favorite = false,
      });
}
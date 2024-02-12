class Product {
  final String name;
  final String image;
  final double price;

  Product({required this.name, required this.image, required this.price});
}

List<Product> products = [
  Product(name: "Google Pixel Tablet", image: "assets/tablet.png", price: 15),
  Product(name: "Base Camp 4 Person Tent", image: "assets/tent.png", price: 15),
  Product(name: "Utensils with stainless steel", image: "assets/utensils.png", price: 15),
  Product(name: "Google Pixel Tablet", image: "assets/tablet.png", price: 15),
];

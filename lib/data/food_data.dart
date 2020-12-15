class Food {
  final String id;
  final String category;
  final String name;
  final String imagePath;
  final double price;
  final double discount;
  final double ratings;

  Food(
      {this.id,
      this.category,
      this.imagePath,
      this.discount,
      this.name,
      this.price,
      this.ratings});
}

final foods = [
  Food(
    id: "1",
    name: "Steamed Salmon",
    imagePath: "assets/images/lunch.jpeg",
    category: "1",
    price: 150.00,
    discount: 20.00,
    ratings: 99.0,
  ),
  Food(
    id: "1",
    name: "Breakfast Meal",
    imagePath: "assets/images/breakfast.jpeg",
    category: "1",
    price: 200.00,
    discount: 30.5,
    ratings: 70.0,
  ),
];

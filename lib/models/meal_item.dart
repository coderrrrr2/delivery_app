class MealItem {
  final String image;
  final String mealName;
  final double mealPrice;
  final int calories;
  final int timeToPrepare;
  final double rating;
  final String description;

  MealItem({
    required this.image,
    required this.mealName,
    required this.mealPrice,
    required this.calories,
    required this.timeToPrepare,
    required this.rating,
    required this.description,
  });

  factory MealItem.fromJson(Map<String, dynamic> json) {
    return MealItem(
      image: json['image'] ?? '',
      mealName: json['productName'] ?? 'Unknown Meal',
      mealPrice: (json['productPrice'] as num?)?.toDouble() ?? 0.0,
      calories: json['calories'] ?? 0,
      timeToPrepare: json['timeToPrepare'] ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] ?? 'No description available',
    );
  }
}

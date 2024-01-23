import 'package:delivery_app/models/meal_item.dart';
import 'package:delivery_app/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dataProvider = FutureProvider<List<MealItem>>((ref) {
  final list = ref.read(userProvider).getAllProducts();
  return list;
});

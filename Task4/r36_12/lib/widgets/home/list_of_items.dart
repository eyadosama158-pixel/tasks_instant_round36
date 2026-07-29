import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/data.dart';
import '../../core/routes.dart';
import '../../model/food_model.dart';
import 'food_item.dart';

class ListOfItems extends StatelessWidget {
  final String selectedCategory;

  const ListOfItems({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    List<FoodModel> filteredFoods = selectedCategory == "All"
        ? foodList
        : foodList.where((food) {
            return food.category == selectedCategory;
          }).toList();

    return Expanded(
      child: GridView.builder(
        itemCount: filteredFoods.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 180,
          mainAxisSpacing: 20,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.push(Routes.food, extra: filteredFoods[index]);
            },
            child: FoodItem(foodModel: filteredFoods[index]),
          );
        },
      ),
    );
  }
}

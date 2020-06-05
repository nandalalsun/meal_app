import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_items.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String title = routeArgs['title'];
    final String id = routeArgs['id'];
    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeal[index].id,
            title: categoryMeal[index].title,
            imageUrl: categoryMeal[index].imageUrl,
            duration: categoryMeal[index].duration,
            affordability: categoryMeal[index].affordability,
            complexity: categoryMeal[index].complexity,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}

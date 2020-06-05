import 'package:flutter/material.dart';
import 'package:meal_app/constraints/constraints.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  final String mealId;
  MealDetailsScreen(this.mealId);
  @override
  Widget build(BuildContext context) {
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 300.0,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              height: 300.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Ingredients',
              style: kTitle.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

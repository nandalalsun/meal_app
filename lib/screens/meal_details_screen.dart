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
      body: SingleChildScrollView(
        child: Column(
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
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black87),
                shape: BoxShape.rectangle,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              padding: EdgeInsets.all(10.0),
              height: 200.0,
              width: 300.0,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '${selectedMeal.ingredients[index]}',
                          style: body1,
                        )),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Steps',
                style: kTitle.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black87),
                shape: BoxShape.rectangle,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              padding: EdgeInsets.all(10.0),
              height: 200.0,
              width: 300,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '${index + 1}',
                          
                       ),
                      ),
                      title: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '${index + 1} ${selectedMeal.steps[index]}',
                            style: body1,
                          )),
                    ),
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

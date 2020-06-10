import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meal_screen.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/fileter_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import './models/meal.dart';
import 'package:meal_app/dummy_data.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarians': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favouriteMeals = [];

  void _setFilter(Map<String, bool> filterData){
    setState(() {
      _filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarians'] && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(favouriteMeal: favouriteMeals),
        CategoryMealScreen.routeName : (ctx) => CategoryMealScreen(availableMeals),
        FilterScreen.routeName :(ctx) => FilterScreen(_filters, _setFilter),
        TabsScreen.routeName : (context) => TabsScreen(),
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (context){
         return CategoryScreen();
        });
      },
    );
  }
}

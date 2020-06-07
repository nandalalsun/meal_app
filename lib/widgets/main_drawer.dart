import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/fileter_screen.dart';
import '../constraints/constraints.dart';
import '../screens/tabs_screen.dart';
import 'package:meal_app/dummy_data.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarians': false,
  };
  List<Meal> availableMeals = DUMMY_MEALS;

  void _setFilter(Map<String, bool> filterData){
      setState(() {
        _filters = filterData;
        availableMeals = DUMMY_MEALS.where((element) {

        }).toList();
      });
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5.0,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(30),
            width: double.infinity,
            height: 200,
            child: Center(
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  color: Colors.white,
                ),
                softWrap: true,
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pinkAccent, Colors.amberAccent],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                tileMode: TileMode.mirror,
              ),
              color: Colors.amber[200],
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.filter),
            title: Text(
              'Filter',
              style: kTitle,
            ),
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return FilterScreen(_setFilter);
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text(
              'Meals',
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
                return TabsScreen();
              }));
            },
          ),
        ],
      ),
    );
  }
}

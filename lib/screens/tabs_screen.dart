import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/favourite_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'category_screen.dart';
import 'favourite_screen.dart';


class TabsScreen extends StatefulWidget {
  static const routeName = '/tabScreen';
  final List<Meal> favouriteMeal;
  TabsScreen({this.favouriteMeal});
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _pageIndex = 0;
  final List<Map<String, Object>> _pages= [
   {'Page' : CategoryScreen(),
     'title' : 'Category',
   },
    {'Page' : FavouriteScreen(widget.favouriteMeal),
      'title' : 'Favourite',
    }
  ];
  void _selectedPage(int index){
    setState(() {
      _pageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_pageIndex]['title']),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        selectedItemColor: Colors.white70,
        unselectedItemColor: Colors.black45,
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor:Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Category'),
          ),
          BottomNavigationBarItem(
    backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.favorite),
            title: Text('Favourite'),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _pages[_pageIndex]['Page'],
    );
  }
}

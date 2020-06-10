import 'package:flutter/material.dart';
import '../screens/fileter_screen.dart';
import '../constraints/constraints.dart';
import '../screens/tabs_screen.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {

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
              Navigator.pushReplacementNamed(context, FilterScreen.routeName);
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
              Navigator.pushReplacementNamed(context, TabsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import '../constraints/constraints.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filterScreen';
  final Function _setFilter;
  final Map<String, bool> currentFilter;
  FilterScreen( this.currentFilter, this._setFilter,);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  bool _isGluttonFree = false;
  bool _isVegan = false;
  bool _isLactoseFree = false;
  bool _isVeg = false;

  Widget _buildSwitchedTile(
      bool currentValue, String title, String subtitle, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  void initState() {
    _isGluttonFree = widget.currentFilter['gluten'];
    _isVeg = widget.currentFilter['vegetarians'];
    _isVegan = widget.currentFilter['vegan'];
    _isLactoseFree = widget.currentFilter['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filter'),
      ),
      body: Column(
        children: <Widget>[
          _buildSwitchedTile(
            _isGluttonFree,
            'Glutton Free',
            'Select only glutton free items.',
            (newValue) {
              setState(
                () {
                  _isGluttonFree = newValue;
                },
              );
            },
          ),
          _buildSwitchedTile(
              _isLactoseFree, 'Lactose Free', 'Select only lactose free foods.',
              (newValue) {
            setState(() {
              _isLactoseFree = newValue;
            });
          }),
          _buildSwitchedTile(
              _isVeg, 'Veg Foods', 'Select only vegetarians foods.',
              (newValue) {
            setState(() {
              _isVeg = newValue;
            });
          }),
          _buildSwitchedTile(_isVegan, 'Vegan', 'Select only vegan items',
              (newValue) {
            setState(() {
              _isVegan = newValue;
            });
          }),
          SizedBox(
            height: 30.0,
          ),

             FlatButton(
              color: Colors.pink[300],
              onPressed: (){
                final selectedFilter = {
                  'gluten': _isGluttonFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegetarians': _isVeg,
                };
                widget._setFilter(selectedFilter);
                Navigator.pushReplacementNamed(context, TabsScreen.routeName);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Save Filter', style: kTitle,),
              ),
            ),
        ],
      ),
    );
  }
}

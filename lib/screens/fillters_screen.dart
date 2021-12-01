import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function saveFilter;
  final Map<String,bool> currentFilter;

  FilterScreen(this.currentFilter,this.saveFilter);

  //FilterScreen(Function saveFilter,String someName) : this.saveFilter = saveFilter,this.someName =someName;


  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _vegetarian = false;
  bool _glutenFree = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {

    _vegetarian = widget.currentFilter['vegetarian'];
    _vegan = widget.currentFilter['vegan'];
    _lactoseFree = widget.currentFilter['lactose'];
    _glutenFree = widget.currentFilter['gluten'];
    super.initState();
  }


  Widget generateListTile(String title, String subTitle, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
          actions: [
            IconButton(icon: Icon(Icons.save), onPressed: () {
              widget.saveFilter({
                'gluten':_glutenFree,
                'lactose':_lactoseFree,
                'vegan':_vegan,
                "vegetarian":_vegetarian,
              });
            })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6,
              ),
            ),
            Expanded(
                child: ListView(
                  children: [
                    generateListTile('Gluten-Free',
                        'Only Include Gluten Free Meals', _glutenFree, (
                            newVal) {
                          setState(() {
                            _glutenFree = newVal;
                          });
                        }),
                    generateListTile(
                        'Vegetarian', 'Only Include Vegetarian Meals',
                        _vegetarian,
                            (newVal) {
                          setState(() {
                            _vegetarian = newVal;
                          });
                        }),
                    generateListTile(
                        'Vegan', 'Only Include Vegan Meals', _vegan,
                            (newVal) {
                          setState(() {
                            _vegan = newVal;
                          });
                        }),
                    generateListTile('Lactose Free',
                        'Only Include Lactose Free Meals', _lactoseFree, (
                            newVal) {
                          setState(() {
                            _lactoseFree = newVal;
                          });
                        }),
                  ],
                ))
          ],
        ));
  }
}

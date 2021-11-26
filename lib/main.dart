import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'file:///E:/Faltu/flutterSeries/meals_app/lib/screens/categories_screen.dart';
import 'file:///E:/Faltu/flutterSeries/meals_app/lib/screens/category_meals_screen.dart';

void main() {
  runApp(MaterialApp(
    title: "DeliMeals",
    theme: ThemeData(
      primarySwatch: Colors.pink,
      accentColor: Colors.amber,
      canvasColor: Color.fromRGBO(255, 254, 229, 1),
      fontFamily: 'Raleway',
      textTheme: ThemeData.light().textTheme.copyWith(
        bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1),),
        bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
        headline6: TextStyle(fontSize: 20,fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold)
      ),
    ),
    home: CategoriesScreen(),
    routes: {'/category-meals':(ctx) => CategoryMealsScreen()},
  ));
}


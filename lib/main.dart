import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(MaterialApp(
    title: "DeliMeals",
    debugShowCheckedModeBanner: false,
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
    home: TabsScreen(),
    routes: {'/category-meals':(ctx) => CategoryMealsScreen(),
              '/category-meals-details':(ctx) => MealDetail()},
    /*
    * onGenerateRoute: (setting) {},
    * it is used when an unknown routes is called and we can use this if we don't know where to land
    * it has setting and we have to return MaterialPageRoute with and a scaffold with contents
    * it can be used when we create the page name dynamically because we can use setting.name to refer
    *
     */
    // onUnknownRoute is used we have not defined named route and also we are not generating route using onGenerateRoute
    // then it will call onUnknownRoute.
    // onUnknownRoute: (setting) {return MaterialPageRoute(builder: (context) {constructor})},
    onUnknownRoute: (setting) {return MaterialPageRoute(builder: (ctx) {CategoriesScreen();});},




  ));
}


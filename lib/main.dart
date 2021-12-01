import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/fillters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

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
    "vegetarian": false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilter(Map<String, bool> data) {
    setState(() {
      _filters = data;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) return false;
        if (_filters['lactose'] && !meal.isLactoseFree) return false;
        if (_filters['vegan'] && !meal.isVegan) return false;
        if (_filters['vegetarian'] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    int existingIndex =
        _favouriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool isMealFavorite(String mealId) {
    return _favouriteMeals.any((meal)=> meal.id == mealId );

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliMeals",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
      ),
      //home: TabsScreen(),
      routes: {
        '/': (ctx) => TabsScreen(_favouriteMeals),
        '/category-meals': (ctx) => CategoryMealsScreen(_availableMeals),
        '/category-meals-details': (ctx) => MealDetail(_toggleFavorite,isMealFavorite),
        '/filters-screen': (ctx) => FilterScreen(_filters, _setFilter),
      },
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
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (ctx) {
          return CategoriesScreen();
        });
      },
    );
  }
}

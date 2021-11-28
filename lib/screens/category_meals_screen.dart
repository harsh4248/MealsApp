import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meals_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;
  //
  // CategoryMealsScreen(this.categoryId,this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    Map<String, String> argsPassed =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    String categoryTitle = argsPassed['title'];
    String categoryId = argsPassed['id'];
    final List<Meal> meals_list = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            title: meals_list[index].title,
            imageUrl: meals_list[index].imageUrl,
            duration: meals_list[index].duration,
            afford: meals_list[index].affordability,
            complex: meals_list[index].complexity,
          );
        },
        itemCount: meals_list.length,
      ),
    );
  }
}

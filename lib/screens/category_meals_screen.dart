import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/meal.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {

  // final String categoryId;
  // final String categoryTitle;
  //
  // CategoryMealsScreen(this.categoryId,this.categoryTitle);


  @override
  Widget build(BuildContext context) {

    Map<String,String> argsPassed = ModalRoute.of(context).settings.arguments as Map<String,String>;
    String categoryTitle = argsPassed['title'];
    String categoryId = argsPassed['id'];
    final List<Meal> meals_list = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (context,index) {
        return Text(meals_list[index].title);
      },itemCount: meals_list.length,),
    );
  }
}

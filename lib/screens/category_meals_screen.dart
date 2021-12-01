import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meals_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;
  //
  // CategoryMealsScreen(this.categoryId,this.categoryTitle);
  final List<Meal> availableMeal;
  CategoryMealsScreen(List<Meal> meals): this.availableMeal = meals;

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Map<String, String> argsPassed;
  String categoryTitle;
  String categoryId;
  List<Meal> meals_list;
  bool isDataInit = false;
  @override
  void initState() {


    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!isDataInit) {
      argsPassed =
      ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      categoryTitle = argsPassed['title'];
      categoryId = argsPassed['id'];
      meals_list = widget.availableMeal.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      isDataInit = true;
    }
    super.didChangeDependencies();
  }

  void deleteMeal(String id) {
    setState(() {
      meals_list.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: meals_list[index].id,
            title: meals_list[index].title,
            imageUrl: meals_list[index].imageUrl,
            duration: meals_list[index].duration,
            afford: meals_list[index].affordability,
            complex: meals_list[index].complexity,
            deleteMeal: deleteMeal,
          );
        },
        itemCount: meals_list.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';

class MealDetail extends StatelessWidget {
  Widget createTite(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget makeList(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 200,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> passedArgument =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    Meal selectedMeal = DUMMY_MEALS.firstWhere((meals) {
      if (meals.id == passedArgument['id']) return true;
      return false;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            createTite(context, "Ingerdients"),
            makeList(context, ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                );
              },
              itemCount: selectedMeal.ingredients.length,
            ),),
            createTite(context, "Process"),
            makeList(context, ListView.builder(itemBuilder: (context,index) {
              return ListTile(
                leading: CircleAvatar(child: Text("# ${index+1}")),
                title: Text(selectedMeal.steps[index]),
              );
            },itemCount: selectedMeal.steps.length,)),
          ],
        ),
      ),
    );
  }
}

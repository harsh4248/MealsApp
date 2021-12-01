import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meals_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteList;

  FavouriteScreen(List<Meal> list) : favouriteList = list;

  @override
  Widget build(BuildContext context) {
    return favouriteList.length == 0
        ? Center(
            child: Text("You have not added any favourite -- try adding some"),
          )
        : Center(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return MealItem(
                    id: favouriteList[index].id,
                    title: favouriteList[index].title,
                    imageUrl: favouriteList[index].imageUrl,
                    duration: favouriteList[index].duration,
                    complex: favouriteList[index].complexity,
                    afford: favouriteList[index].affordability,
                    deleteMeal: () {});
              },
              itemCount: favouriteList.length,
            ),
          );
  }
}

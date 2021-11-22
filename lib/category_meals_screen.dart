import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('$categoryId $categoryTitle'),
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DeliMeals"),),
      body: GridView(
        padding: EdgeInsets.all(25.0),
        children: DUMMY_CATEGORIES.map((category)=> CategoryItem(title: category.title,color: category.color,id: category.id,)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}

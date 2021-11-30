import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:flutter/foundation.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complex;
  final Affordability afford;
  final Function deleteMeal;

  MealItem(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complex,
      @required this.afford,
      @required this.deleteMeal});

  void selectMeal(BuildContext context) {
    //Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {return MealDetail();}));

    Navigator.of(context).pushNamed('/category-meals-details',
        arguments: {"id": id}).then((result) {
      if(result != null)
        deleteMeal(result);
    });
  }

  String get affordibilityText {
    if (Affordability.Affordable == afford) return "Affordable";
    if (Affordability.Luxurious == afford) return "Luxurious";
    if (Affordability.Pricey == afford) return "Pricey";
  }

  String get ComplexityText {
    if (Complexity.Simple == complex) return "Simple";
    if (Complexity.Challenging == complex) return "Challenging";
    if (Complexity.Hard == complex) return "Hard";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 4,
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 220,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 6,
                        ),
                        Text("$duration min"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(
                          width: 6,
                        ),
                        Text("$ComplexityText"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.money),
                        SizedBox(
                          width: 6,
                        ),
                        Text("$affordibilityText"),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

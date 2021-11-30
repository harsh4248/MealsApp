import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget listTileWidget(String content,IconData icon,Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        content,
        style: TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking up!!!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
            color: Theme.of(context).accentColor,
          ),
          SizedBox(
            height: 20,
          ),
          listTileWidget("Meals", Icons.restaurant,() {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          listTileWidget("Filters", Icons.settings,() {
            Navigator.of(context).pushReplacementNamed('/filters-screen');
          }),
        ],
      ),
    );
  }
}

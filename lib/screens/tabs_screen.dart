import "package:flutter/material.dart";
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favourite_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> with TickerProviderStateMixin {

  List<Map<String, dynamic>> _pages = [
    {"Page": CategoriesScreen(), "title": "Categories"},
    {"Page": FavouriteScreen(), "title": "Favourite"}
  ];
  String AppBarTitle = "Categories";
  int selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
      if (selectedPageIndex == 0)
        AppBarTitle = "Categories";
      if (selectedPageIndex == 1)
        AppBarTitle = "Favourite";
    });
  }

  @override
  Widget build(BuildContext context) {
    // These is the default way to do and the easy way too and tab bar at top below the app bar but if we are using it remember not to use appbar because
    // it will have the default app bar then Tab Bar and then appbar again of the screen so avoid creating the appbar if
    // using this method.
    // return DefaultTabController(length: 2, child: Scaffold(
    //   appBar: AppBar(title: Text("Meals"),bottom: TabBar(tabs: [
    //     Tab(icon: Icon(Icons.category),text: "Categories",),
    //     //Example of how we can make custom
    //     //Tab(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround ,children: [Icon(Icons.category),Text("Categories")],),),
    //     Tab(icon: Icon(Icons.star),text: "Favourite"),
    //   ],),),
    //   body: TabBarView(children: [
    //
    //     CategoriesScreen(),
    //     FavouriteScreen()
    //   ],),
    // ));
    // Second Method to add tab bar is to add it at bottom of the screen
    return Scaffold(
      appBar: AppBar(
        title: Text(AppBarTitle),
      ),
      drawer: MainDrawer(),
      body: _pages[selectedPageIndex]["Page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme
            .of(context)
            .accentColor,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourite",
          ),
        ],
        //selectedLabelStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}

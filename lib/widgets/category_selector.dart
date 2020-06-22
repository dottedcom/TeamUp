import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  CategorySelectorState createState() => CategorySelectorState();
}

class CategorySelectorState extends State<CategorySelector> {

  int selectedIndex = 2;
  final List<String> categories = [
    "Tutte",
    "Musica",
    "Arte",
    "Sport",
    "Cinema",
    "Business"
  ];

  @override
  Widget build(BuildContext context) {
    //TODO MODIFICARE CATEGORYFILTER CON TABBAR COME myprojects.dart
    return Container(
        height: 50.0,
        //setto lo stesso colore dell'app principale --> primary color
        color: Theme
            .of(context)
            .primaryColor,
        //visualizzo la lista di categories
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              //metodo per prendere l'onTap sulle categories
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    return selectedIndex;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 15.0),
                  child: Text(categories[index], style: TextStyle(
                      color: index == selectedIndex ? Colors.white : Colors
                          .white60,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2)),
                ),
              );
            })
    );
  }

  String getSelected() {
    String result = categories[selectedIndex];
    return result;
  }


}
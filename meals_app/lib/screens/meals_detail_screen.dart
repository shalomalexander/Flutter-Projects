import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealsDetailScreen extends StatelessWidget {
  static const routeName = '/meals-detail';

  Widget buildTitle(BuildContext context, Icon icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        icon,
        SizedBox(
          width: 6,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.title,
        ),
      ],
    );
  }

  Widget buildList(BuildContext context, List<String> ingredients) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                ingredients[index],
              ),
            ),
          );
        },
        itemCount: ingredients.length);
  }

  @override
  Widget build(BuildContext context) {
    final argId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meals) {
      return meals.id == argId;
    });

    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 230,
              width: screenSize.width,
              padding: EdgeInsets.all(1),
              child: Card(
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      child: Image.network(
                        selectedMeal.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: buildTitle(
                  context, Icon(Icons.calendar_today), 'Ingredients'),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              height: 140,
              width: screenSize.width - 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(),
                color: Colors.greenAccent,
              ),
              //color: Colors.amber,
              child: buildList(context, selectedMeal.ingredients),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: buildTitle(context, Icon(Icons.bubble_chart), 'Steps'),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 200,
              width: screenSize.width - 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(),
                color: Colors.greenAccent,
              ),
              //color: Colors.amber,
              child: buildList(context, selectedMeal.steps),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

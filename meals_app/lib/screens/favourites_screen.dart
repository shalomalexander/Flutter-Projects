import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';


class FavouritesScreen extends StatelessWidget {

  List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
   if(favouriteMeals.isEmpty) {
      return Center(
      child: Text("You havent selected any favourite Item!!"),
    );
   } else {
     return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imageUrl: favouriteMeals[index].imageUrl,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
          );
        },
        itemCount: favouriteMeals.length,
      );
   }
  }
}

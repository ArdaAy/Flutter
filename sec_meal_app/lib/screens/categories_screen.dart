import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sec_meal_app/models/category.dart';
import '../widgets/category_item.dart';
import '../dummy_category.dart';

class CategoriesScreen extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
      ),
      body: GridView(
        padding: EdgeInsets.all(25),
        // Kaç column olacağını belirliyor
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          // eğer 200 witdt varsa ve 200 verirsek sadece bir column olur
          maxCrossAxisExtent: 200,
          // 200 width varsa 300 height olacak
          childAspectRatio: 3 / 2,
          // Spacing ayarları
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
          .map((catData) => CategoryItem(
            catData.id,
            catData.title, 
            catData.color
          )).toList()
        /*
        <Widget>[
          for(Category a in DUMMY_CATEGORIES){
            CategoryItem(a.title, a.color)
          }
        ],*/
      ),
    ); 
  }
}
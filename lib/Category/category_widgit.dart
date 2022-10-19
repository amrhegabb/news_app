import 'package:flutter/material.dart';
import 'package:news_app/Category/category_Item.dart';

class CategoryWidgit extends StatelessWidget {
  CategoryItem category;
  int index;
  CategoryWidgit(this.category, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(18),
            topLeft: Radius.circular(18),
            bottomLeft: Radius.circular(index % 2 == 0 ? 18 : 0),
            bottomRight: Radius.circular(index % 2 == 0 ? 0 : 18)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/images/${category.id}.png"),
            height: 120,
            fit: BoxFit.fitHeight,
          ),
          Text(
            category.title,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
    );
  }
}

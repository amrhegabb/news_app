// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:news_app/Category/category_Item.dart';
import 'package:news_app/Category/category_widgit.dart';

class CategoriesFragment extends StatelessWidget {
  var categories = CategoryItem.getAllCategories();
  Function oncategoryclick;
  CategoriesFragment({
    required this.oncategoryclick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.builder(
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return InkWell(
            onTap: (() {
              oncategoryclick(categories[index]);
            }),
            child: CategoryWidgit(categories[index], index));
      },
    ));
  }
}

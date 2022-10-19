// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class CategoryItem {
  String id;
  String title;
  Color color;
  String imageName;
  CategoryItem({
    required this.id,
    required this.title,
    required this.color,
    required this.imageName,
  });
  static List<CategoryItem> getAllCategories() {
    return [
      CategoryItem(
          id: "sports",
          title: "Sports",
          color: const Color(0xffC91C22),
          imageName: "Sports"),
      CategoryItem(
          id: "general",
          title: "General",
          color: const Color(0xff003E90),
          imageName: "general"),
      CategoryItem(
          id: "health",
          title: "Health",
          color: const Color(0xffED1E79),
          imageName: "health"),
      CategoryItem(
          id: "business",
          title: "Business",
          color: const Color(0xffCF7E48),
          imageName: "business"),
      CategoryItem(
          id: "technology",
          title: "Technology",
          color: const Color(0xff4882CF),
          imageName: "technology"),
      CategoryItem(
          id: "science",
          title: "Science",
          color: const Color(0xffF2D352),
          imageName: "science"),
    ];
  }
}

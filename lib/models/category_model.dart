import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;
  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });
  static List<CategoryModel> getCategories() {
    List<CategoryModel> category = [];

    category.add(
      CategoryModel(
        name: 'Abu essa',
        boxColor: Colors.purpleAccent,
        iconPath: 'assets/icons/flower.jpg',
      ),
    );
    category.add(
      CategoryModel(
        name: 'Essa',
        iconPath: 'assets/icons/flower.jpg',
        boxColor: Colors.tealAccent,
      ),
    );
    category.add(
      CategoryModel(
        name: 'Jahid',
        iconPath: 'assets/icons/flower.jpg',
        boxColor: Colors.lightGreen,
      ),
    );
    category.add(
      CategoryModel(
        name: 'Rahim',
        iconPath: 'assets/icons/flower.jpg',
        boxColor: Colors.grey,
      ),
    );

    return category;
  }
}

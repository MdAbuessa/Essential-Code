import 'package:flutter/material.dart';
import 'package:media_query/models/category_model.dart';

class CatagoryShow extends StatefulWidget {
  CatagoryShow({super.key});

  @override
  State<CatagoryShow> createState() => _CatagoryShowState();
}

class _CatagoryShowState extends State<CatagoryShow> {
  List<CategoryModel> categories = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  void initState() {
    super.initState();
    _getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    return Scaffold(
      appBar: AppBar(
        title: Text('Catagory page'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.all(20.0), child: Text('Category')),
          SizedBox(height: 10),
          category_section(),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  SizedBox category_section() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20, right: 20),
        separatorBuilder: (context, index) => SizedBox(width: 25),
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            decoration: BoxDecoration(
              color: categories[index].boxColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red,
                        spreadRadius: 3,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      radius: 20, // Half of 50 (width/height)

                      backgroundImage: AssetImage(categories[index].iconPath),
                    ),
                  ),
                ),
                Text(categories[index].name),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // List of food items
  List<String> foodItems = [
    "Pizza",
    "Burger",
    "Pasta",
    "Sushi",
    "Tacos",
    "Salad",
  ];

  // List to store selected food items
  List<String> selectedFoodItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Your Food"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Your Favorite Foods",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // List of checkboxes
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(foodItems[index]),
                    value: selectedFoodItems.contains(foodItems[index]),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          selectedFoodItems.add(foodItems[index]);
                        } else {
                          selectedFoodItems.remove(foodItems[index]);
                        }
                      });
                    },
                    //if this property is present ,the checkbox will appear on the left silte of the text
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            // Display selected food items
            Text(
              "Selected Food Items:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              selectedFoodItems.isNotEmpty
                  ? selectedFoodItems.join(", ")
                  : "No food selected",
              style: TextStyle(fontSize: 16, color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}

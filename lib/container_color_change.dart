import 'package:flutter/material.dart';
import 'package:media_query/cardPage.dart';
import 'package:media_query/progress_percent_indecator.dart';

class ContainerColorChange extends StatefulWidget {
  const ContainerColorChange({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContainerColorChangeState createState() => _ContainerColorChangeState();
}

class _ContainerColorChangeState extends State<ContainerColorChange> {
  int _selectedContainerIndex = 0; //  int? meens its nullable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedContainerIndex = 0; // Select the first container
                    });
                  },
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:
                          _selectedContainerIndex == 0
                              ? Colors
                                  .green // Selected color
                              : Colors.grey[300], // Default color
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text('Progress Indecator')),
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedContainerIndex =
                          1; // Select the second container
                    });
                  },
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:
                          _selectedContainerIndex == 1
                              ? Colors
                                  .green // Selected color
                              : Colors.grey[300], // Default color
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text('Card page')),
                  ),
                ),
                SizedBox(height: 20),
                // Push the button to the bottom
                ElevatedButton(
                  onPressed:
                      // ignore: unnecessary_null_comparison
                      _selectedContainerIndex != null
                          ? () {
                            if (_selectedContainerIndex == 0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => ProgressPercentIndecator(),
                                ),
                              );
                            } else if (_selectedContainerIndex == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Cardpage(),
                                ),
                              );
                            }
                          }
                          : null, // Disable the button if no container is selected
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

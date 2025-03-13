import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:math';

class ProgressPercentIndecator extends StatefulWidget {
  const ProgressPercentIndecator({super.key});

  @override
  State<ProgressPercentIndecator> createState() =>
      _ProgressPercentIndecatorState();
}

class _ProgressPercentIndecatorState extends State<ProgressPercentIndecator> {
  double _percentage = 0.1; // Initial percentage

  Future<void> _refresh() async {
    // Simulate a refresh process (e.g., fetching data)
    await Future.delayed(
      const Duration(seconds: 1),
    ); // Reduced duration for testing

    setState(() {
      // Generate a random percentage between 0.0 and 1.0
      _percentage = Random().nextDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indecator')),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: LayoutBuilder(
            builder: (
              BuildContext context,
              BoxConstraints viewportConstraints,
            ) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularPercentIndicator(
                            animation: true,
                            animationDuration: 1000,
                            radius: 100,
                            lineWidth: 30,
                            percent: _percentage, // Use the state variable
                            progressColor: Colors.deepPurple,
                            backgroundColor: Colors.deepPurple.shade100,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text(
                              '${(_percentage * 100).toStringAsFixed(0)}%', // Display current percentage
                              style: const TextStyle(
                                fontSize: 40,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1000,
                            lineHeight: 20,
                            percent: _percentage, // Use the state variable
                            progressColor: Colors.deepPurple,
                            backgroundColor: Colors.deepPurple.shade100,

                            center: Text(
                              '${(_percentage * 100).toStringAsFixed(0)}%', // Display current percentage
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.tealAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ContainerInkwell extends StatefulWidget {
  const ContainerInkwell({super.key});

  @override
  State<ContainerInkwell> createState() => _ContainerInkwellState();
}

class _ContainerInkwellState extends State<ContainerInkwell> {
  final List<String> item = List.generate(16, (index) => 'Item : ${index + 1}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green,
                //borderRadius: BorderRadius.circular(24),
                // border: Border.all(color: Colors.yellow, width: 3),
                border: Border(
                  top: BorderSide(color: Colors.black, width: 1),
                  right: BorderSide(color: Colors.amberAccent, width: 2),
                  bottom: BorderSide(color: Colors.blue, width: 3),
                  left: BorderSide(color: Colors.pink, width: 4),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.5),
                    spreadRadius: 15,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
            ),
            SizedBox(height: 52),
            InkWell(
              splashColor: Colors.amber,
              radius: 40,
              borderRadius: BorderRadius.circular(10),
              onLongPress: () {
                //
              },
              child: (Text('Ink Well')),
            ),
            SizedBox(height: 52),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0), // Round the corners
              child: Container(
                width: 100,
                height: 50,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Clipped Container',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2,
                ),
                itemCount: 16,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(color: Colors.green),
                      child: Center(child: Text(item[index])),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

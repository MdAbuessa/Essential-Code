import 'package:flutter/material.dart';

class FormDataShow extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  const FormDataShow({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  State<FormDataShow> createState() => _FormDataShowState();
}

class _FormDataShowState extends State<FormDataShow> {
  List<Map<String, String>> userList = [
    {"name": "John Doe", "email": "johndoe@example.com", "phone": "1234567890"},
    {
      "name": "Jane Smith",
      "email": "janesmith@example.com",
      "phone": "0987654321",
    },
  ];
  // Function to add a new user
  void addUser() {
    setState(() {
      userList.add({
        "name": widget.name,
        "email": widget.email,
        "phone": widget.phone.toString(),
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form data show '),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            var user = userList[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.blue),
                title: Text(user["name"] ?? "Unknown"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email: ${user["email"]}"),
                    Text("Phone: ${user["phone"]}"),
                  ],
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

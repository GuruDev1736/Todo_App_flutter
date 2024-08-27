import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Add Todo",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            TextField(
              controller:titleController ,
              decoration: const InputDecoration(
                hintText: "Title",
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                hintText: "Description",
              ),
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 8,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: submitData,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text(
                "Create",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> submitData() async {
    final title = titleController.text.toString();
    final description = descriptionController.text.toString();
    final body = {
      "title": title,
      "description": description,
      "is_completed": false
    };

    final url = "https://api.nstack.in/v1/todos";
    final uri = Uri.parse(url);
    final response = await http.post(
        uri,
        body: jsonEncode(body),
      headers: {
          'Content-Type':'application/json'
      }
    );

    if(response.statusCode == 201)
      {
          showSuccessMessage("Note has created successfully");
          Navigator.pop(context);
      }
    else
      {
          showSuccessMessage("Failed to Create Note");
      }
  }

  void showSuccessMessage( String message)
  {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

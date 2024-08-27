import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_app_flutter/Screens/add.dart';
import 'package:http/http.dart' as http ;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    getAllData();
    super.initState();
  }

  List list  = [];
  bool isLoading = true ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),

      body: Visibility(
        visible: isLoading,
        child: Center(child: CircularProgressIndicator()),
        replacement: RefreshIndicator(
          onRefresh: getAllData,
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index] as Map ;
                return ListTile(
                  leading: CircleAvatar(
                    child: Text("${index+1}"),
                  ),
                  title: Text(item['title']),
                  subtitle: Text(item['description']),
                  trailing: PopupMenuButton(
                    onSelected: (value) {
                      if(value == 'edit')
                        {

                        }

                      if(value == 'delete')
                        {

                        }
                    },
                    itemBuilder: (context) {
                    return[
                        PopupMenuItem(child: Text("Edit"),value: 'edit',),
                        PopupMenuItem(child: Text("Delete"),value: 'delete')
                      ];
                  },
                  ),
                );
          },
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add), onPressed: navigateToAdd),
    );
  }

  void navigateToAdd() {
    final route = MaterialPageRoute(
      builder: (context) => Add(),
    );
    Navigator.push(context, route);
  }

  Future<void> getAllData() async {
    final response = await http.get(Uri.parse("https://api.nstack.in/v1/todos?page=1&limit=20"));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final itemsList = json['items'] as List;
      list = itemsList;
    }
    setState(() {
      isLoading = false;
    });
  }
}

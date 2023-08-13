import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:todo/data/models/todo.dart';
import 'package:todo/ui/widgets/content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<Todos>> receive() async{
    final response =
    await http.get(Uri.parse('https://dummyjson.com/todos'));
    List<Todos> todos = [];

    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;

      for( var item in jsonResponse['todos']) {
        todos.add(Todos.fromJson(item));
      }
    }
    return todos;
}

  List<Todos> todolist = [];
  bool isLoading = true;

  @override
  void initState()
  {
    super.initState();
    Future.delayed(
        Duration.zero, () async
        {
          var data = await receive();
          setState(() {
            todolist = data;
            isLoading = false;
          });
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(child: GridView.builder(
          itemCount: todolist.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Contents(
              todo: todolist[index],
            );
          },
        ),
      ),
    );
  }
}

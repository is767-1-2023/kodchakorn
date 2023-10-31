import 'dart:convert';

import 'package:frist_app/models/todo_model.dart';
import 'package:http/http.dart';

class TodoHttpService {
  Client client = Client();

  Future<List<Todo>> getTodos() async {
    try {
      final respone = await client.get(
        Uri.parse('http://jsonplaceholder.typicode.com/todos'),
      );

      if (respone.statusCode == 200) {
        var all = ALLTodos.fromJson(json.decode(respone.body));
        return all.todos;
      } else {
        throw Exception('Fail to load todos');
      }
    } catch (e) {
      throw Exception('Error while connect to backend');
    }
  }

  void updateTodo(Todo todo) async {
    final respone = await client.put(
      Uri.parse('http://jsonplaceholder.typicode.com/todos/${todo.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'userID': todo.userId,
        'id': todo.id,
        'title': todo.title,
        'completed': todo.completed,
      }),
    );
    if (respone.statusCode != 200) {
      throw Exception('Cannot update todo');
    }
    print(respone.body);
  }
}

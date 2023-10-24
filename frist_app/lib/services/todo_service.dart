import 'dart:convert';

import 'package:frist_app/models/todo_model.dart';
import 'package:http/http.dart';

class TodoHttpService {
  Client client = Client();

  Future<List<Todo>> getTodos() async {
    final respone = await client.get(
      Uri.parse('http://jsonplaceholder.typicode.com/todos'),
    );
    if (respone.statusCode == 200) {
      var all = ALLTodos.fromJson(json.decode(respone.body));
      return all.todos;
    } else {
      throw Exception('Fail to load todos');
    }
  }
}

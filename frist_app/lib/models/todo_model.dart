class Todo {
  final int userId;
  int id;
  final String title;
  bool completed;

  Todo(this.userId, this.id, this.title, this.completed);
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      json['userId'] as int,
      json['id'] as int,
      json['title'] as String,
      json['completed'] as bool,
    );
  }
}

class ALLTodos {
  final List<Todo> todos;
  ALLTodos(this.todos);
  factory ALLTodos.fromJson(List<dynamic> json) {
    List<Todo> todos;
    todos = json.map((item) => Todo.fromJson(item)).toList();
    return ALLTodos(todos);
  }
}

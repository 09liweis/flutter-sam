class Todo {
  final String id;
  final String name;
  final String status;
  final String date;

  Todo({
    required this.id,
    required this.name,
    required this.status,
    required this.date,
  });

  String getId() {
    return id;
  }

  bool isDone() {
    return status == 'done';
  }

  String getName() {
    return name;
  }

  String getDate() {
    return date;
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['_id'],
      name: json['name'],
      status: json['status'],
      date: json['date'],
    );
  }
}

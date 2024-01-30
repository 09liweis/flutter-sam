class Todo {
  String id;
  String name;
  String status;
  String date;

  Todo({
    this.id = '',
    this.name = '',
    this.status = '',
    this.date = '',
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

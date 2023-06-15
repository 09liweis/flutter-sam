class Task {
  final String id;
  final String name;
  final String status;
  final String date;

  Task({
    required this.id,
    required this.name,
    required this.status,
    required this.date,
  });

  bool isDone() {
    return status == 'done';
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['_id'],
      name: json['name'],
      status: json['status'],
      date: json['date'],
    );
  }
}

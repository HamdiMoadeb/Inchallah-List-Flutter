class Task {
  //constructor
  Task(
    this.completed,
    this.id,
    this.description,
    this.owner,
  );

  String id;
  bool completed;
  String description;
  String owner;

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      json['completed'],
      json['_id'].toString(),
      json['description'].toString(),
      json['owner'].toString(),
    );
  }
}

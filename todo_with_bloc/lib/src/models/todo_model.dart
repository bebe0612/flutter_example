class TodoModel {
  final int id;
  final String title;
  final String subTitle;
  final DateTime date;
  const TodoModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.date,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      subTitle: json['subTitle'],
      date: DateTime.parse(json['date']),
    );
  }
}

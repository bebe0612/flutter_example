class TodoAddForm {
  final String title;
  final String subTitle;
  final DateTime dateTime;

  const TodoAddForm({
    required this.title,
    required this.subTitle,
    required this.dateTime,
  });

  toJson() {
    return {
      'title': title,
      'subTitle': subTitle,
      'date': dateTime.toIso8601String(),
    };
  }

  TodoAddForm copyWith({
    String? title,
    String? subTitle,
    DateTime? dateTime,
  }) {
    return TodoAddForm(
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}

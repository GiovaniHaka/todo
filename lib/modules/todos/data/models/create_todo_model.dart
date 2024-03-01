class CreateTodoModel {
  final String deviceId;
  final String title;
  final DateTime date;

  CreateTodoModel({
    required this.deviceId,
    required this.title,
    required this.date,
  });

  toMap() {
    return {
      'deviceId': deviceId,
      'title': title,
      'date': date.millisecondsSinceEpoch,
    };
  }
}

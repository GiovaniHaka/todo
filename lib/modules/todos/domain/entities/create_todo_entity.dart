class CreateTodoEntity {
  final String deviceId;
  final String title;
  final DateTime date;

  CreateTodoEntity({
    required this.deviceId,
    required this.title,
    required this.date,
  });
}
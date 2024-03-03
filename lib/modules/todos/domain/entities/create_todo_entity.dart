class CreateTodoEntity {
  final String deviceId;
  final String title;
  final DateTime date;
  final String? imageUrl;

  CreateTodoEntity({
    required this.deviceId,
    required this.title,
    required this.date,
    this.imageUrl,
  });
}
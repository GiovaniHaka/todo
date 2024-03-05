/// Classe que representa a entidade de criação de uma tarefa.
class CreateTodoEntity {
  final String deviceId;
  final String title;
  final DateTime date;
  final String? imageUrl;

  /// Construtor da classe [CreateTodoEntity].
  ///
  /// [deviceId] é o identificador do dispositivo.
  /// [title] é o título da tarefa.
  /// [date] é a data da tarefa.
  /// [imageUrl] é a URL da imagem associada à tarefa (opcional).
  CreateTodoEntity({
    required this.deviceId,
    required this.title,
    required this.date,
    this.imageUrl,
  });
}
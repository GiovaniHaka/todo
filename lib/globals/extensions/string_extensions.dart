/// Extensão para a classe [String] que adiciona o método `capitalize()`.
extension StringExtension on String {
  /// Retorna uma nova [String] com a primeira letra em maiúsculo e as demais em minúsculo.
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

import 'dart:convert';

/// Classe que representa uma entidade de arquivo de armazenamento.
class StorageFileEntity {
  final String path;
  final String url;

  StorageFileEntity({
    required this.path,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'path': path,
      'url': url,
    };
  }

  static StorageFileEntity? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;

    return StorageFileEntity(
      path: map['path'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
}

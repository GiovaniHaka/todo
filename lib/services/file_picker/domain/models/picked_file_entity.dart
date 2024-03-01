import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

class PickedFile {
  final File file;
  final String name;
  final String extension;

  const PickedFile({
    required this.file,
    required this.name,
    required this.extension,
  });

  factory PickedFile.fromPlatformFile(PlatformFile platformFile) {
    File platformFileToFile(String? path) {
      if (path == null) {
        throw Exception('PlatformFile.path is null');
      }
      final file = File(path);
      return file;
    }

    return PickedFile(
      file: platformFileToFile(platformFile.path),
      name: platformFile.name,
      extension: platformFile.extension ?? '',
    );
  }

  Future<String> toBase64() async {
    Uint8List imagebytes = await file.readAsBytes();
    String base64string = base64.encode(imagebytes);
    return base64string;
  }

  String get nameTimeBased {
    final currentDateTime = DateTime.now().millisecondsSinceEpoch;
    return '${currentDateTime}_$name';
  }

  @override
  String toString() {
    return 'PickedFile(file: $file, name: $name, extension: $extension)';
  }

  PickedFile copyWith({
    File? file,
    String? name,
    String? extension,
  }) {
    return PickedFile(
      file: file ?? this.file,
      name: name ?? this.name,
      extension: extension ?? this.extension,
    );
  }
}

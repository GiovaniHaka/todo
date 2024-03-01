import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:todo/services/file_picker/domain/models/picked_file_entity.dart';

abstract class LocalFilePickerSource {
  Future<PickedFile?> pickSingleImage();
  Future<PickedFile?> pickSingleFile();
  Future<List<PickedFile>> pickManyFiles();
}

class LocalFilePickerSourceImp implements LocalFilePickerSource {
  @override
  Future<PickedFile?> pickSingleFile() async {
    try {
      final filePicked = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (filePicked == null) {
        return null;
      }

      final pickedFilePath = filePicked.files.single.path;

      File file = File(pickedFilePath!);

      return PickedFile(
        file: file,
        name: filePicked.files.single.name,
        extension: filePicked.files.single.extension ?? '',
      );
    } catch (e) {
      log('$this: $e');
      throw Exception(e);
    }
  }

  @override
  Future<PickedFile?> pickSingleImage() async {
    try {
      final filePicked = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (filePicked == null) {
        return null;
      }

      final pickedFilePath = filePicked.files.single.path;

      File file = File(pickedFilePath!);

      return PickedFile(
        file: file,
        name: filePicked.files.single.name,
        extension: filePicked.files.single.extension ?? '',
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<PickedFile>> pickManyFiles() async {
    try {
      final pickedFiles =
          await FilePicker.platform.pickFiles(allowMultiple: true);

      if (pickedFiles == null) {
        return [];
      }

      final files =
          pickedFiles.files.map((e) => PickedFile.fromPlatformFile(e)).toList();

      return files;
    } catch (e) {
      throw Exception(e);
    }
  }
}

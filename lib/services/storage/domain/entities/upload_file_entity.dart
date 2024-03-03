import 'package:todo/services/file_picker/domain/models/picked_file_entity.dart';

class UploadFileEntity {
  final String path;
  final PickedFile pickedFile;

  UploadFileEntity({
    required this.path,
    required this.pickedFile,
  });
}

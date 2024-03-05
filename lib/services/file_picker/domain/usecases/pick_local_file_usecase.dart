
import 'package:todo/services/file_picker/data/sources/local_file_source.dart';
import 'package:todo/services/file_picker/domain/models/picked_file_entity.dart';

abstract class PickLocalFileUsecase {
  Future<PickedFile?> singleImage();
  Future<PickedFile?> singleFile();
  Future<List<PickedFile>> manyFiles();
}

/// Classe que representa a implementação do [PickLocalFileUsecase].
class PickLocalFileUsecaseImp implements PickLocalFileUsecase {
  final LocalFilePickerSource _source;

  PickLocalFileUsecaseImp({
    required LocalFilePickerSource source,
  }) : _source = source;

  @override
  Future<PickedFile?> singleFile() async {
    return await _source.pickSingleFile();
  }

  @override
  Future<List<PickedFile>> manyFiles() async {
    return await _source.pickManyFiles();
  }

  @override
  Future<PickedFile?> singleImage() async {
    return await _source.pickSingleImage();
  }
}

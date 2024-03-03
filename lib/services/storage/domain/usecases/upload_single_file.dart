import 'package:dartz/dartz.dart';
import 'package:todo/globals/failures/failure.dart';
import 'package:todo/services/storage/data/sources/file_storage_source.dart';
import 'package:todo/services/storage/domain/entities/storage_file_entity.dart';
import 'package:todo/services/storage/domain/entities/upload_file_entity.dart';

abstract class UploadSingleFile {
  Future<Either<Failure, StorageFileEntity>> call(UploadFileEntity request);
}

class UploadSingleFileImp implements UploadSingleFile {
  late FileStorageSource _source;

  UploadSingleFileImp(FileStorageSource source) {
    _source = source;
  }

  @override
  Future<Either<Failure, StorageFileEntity>> call(
    UploadFileEntity request,
  ) async {
    return await _source.uploadSingleFile(request);
  }
}

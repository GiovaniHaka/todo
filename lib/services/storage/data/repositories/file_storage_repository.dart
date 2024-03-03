import 'package:dartz/dartz.dart';
import 'package:todo/globals/failures/failure.dart';
import 'package:todo/services/storage/data/sources/file_storage_source.dart';
import 'package:todo/services/storage/domain/entities/storage_file_entity.dart';
import 'package:todo/services/storage/domain/entities/upload_file_entity.dart';

abstract class FileStorageRepository {
  Future<Either<Failure, StorageFileEntity>> uploadSingleFile(
      UploadFileEntity request);
  Future<Either<Failure, void>> deleteFileByUrl(String url);
}

class FileStorageRepositoryImp implements FileStorageRepository {
  late FileStorageSource _source;

  FileStorageRepositoryImp(FileStorageSource storage) {
    _source = storage;
  }

  @override
  Future<Either<Failure, StorageFileEntity>> uploadSingleFile(
    UploadFileEntity request,
  ) async {
    return await _source.uploadSingleFile(request);
  }

  @override
  Future<Either<Failure, void>> deleteFileByUrl(String url) {
    return _source.deleteFile(url);
  }
}

import 'package:dartz/dartz.dart';
import 'package:todo/globals/failures/failure.dart';
import 'package:todo/services/storage/data/sources/file_storage_source.dart';
import 'package:todo/services/storage/domain/entities/storage_file_entity.dart';
import 'package:todo/services/storage/domain/entities/upload_file_entity.dart';

/// Classe que representa o repositório de storage de arquivos.
abstract class FileStorageRepository {
  /// Faz o upload de um arquivo para o storage.
  Future<Either<Failure, StorageFileEntity>> uploadSingleFile(
      UploadFileEntity request);

  /// Deleta um arquivo do storage.
  Future<Either<Failure, void>> deleteFileByUrl(String url);
}

/// Classe que representa a implementação do [FileStorageRepository].
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

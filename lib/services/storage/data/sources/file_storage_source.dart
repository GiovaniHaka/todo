import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:todo/globals/failures/failure.dart';
import 'package:todo/services/storage/domain/entities/storage_file_entity.dart';
import 'package:todo/services/storage/domain/entities/upload_file_entity.dart';

abstract class FileStorageSource {
  Future<Either<Failure, StorageFileEntity>> uploadSingleFile(
    UploadFileEntity request,
  );

  Future<Either<Failure, void>> deleteFile(String url);
}

class FileStorageSourceImp implements FileStorageSource {
  late FirebaseStorage _storage;

  FileStorageSourceImp(FirebaseStorage storage) {
    _storage = storage;
  }

  @override
  Future<Either<Failure, StorageFileEntity>> uploadSingleFile(
      UploadFileEntity request) async {
    try {
      final file = request.pickedFile.file;
      final fileName = request.pickedFile.nameTimeBased;
      final path = request.path;

      final finalPath = '$path/$fileName';

      final reference = _storage.ref().child(finalPath);
      await reference.putFile(file);

      final url = await reference.getDownloadURL();

      final fileData = StorageFileEntity(
        path: finalPath,
        url: url,
      );

      return Right(fileData);
    } catch (e, s) {
      return Left(
        Failure(
          error: e,
          stackTrace: s,
          message: 'Não conseguimos fazer o upload do arquivo.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteFile(String url) async {
    try {
      final reference = _storage.refFromURL(url);
      await reference.delete();
      return const Right(null);
    } catch (e) {
      return Left(
        Failure(message: 'Não conseguimos fazer o upload do arquivo.'),
      );
    }
  }
}

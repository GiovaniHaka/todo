import 'package:firebase_storage/firebase_storage.dart';
import 'package:todo/core/binders/binder.dart';
import 'package:todo/services/storage/data/repositories/file_storage_repository.dart';
import 'package:todo/services/storage/data/sources/file_storage_source.dart';
import 'package:todo/services/storage/domain/usecases/upload_single_file.dart';

class StorageServiceBinder implements Binder {
  @override
  void bind() {
    /// [Sources]
    getIt.registerFactory<FileStorageSource>(
      () => FileStorageSourceImp(FirebaseStorage.instance),
    );

    /// [Repositories]
    getIt.registerFactory<FileStorageRepository>(
      () => FileStorageRepositoryImp(getIt.get()),
    );

    /// [Usecases]
    getIt.registerFactory<UploadSingleFile>(
      () => UploadSingleFileImp(getIt.get()),
    );
  }

  @override
  void dispose() {}
}

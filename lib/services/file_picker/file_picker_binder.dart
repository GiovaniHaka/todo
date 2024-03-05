import 'package:todo/core/binders/binder.dart';
import 'package:todo/services/file_picker/data/sources/local_file_source.dart';
import 'package:todo/services/file_picker/domain/usecases/pick_local_file_usecase.dart';

/// Classe que representa o binder do file picker.
class LocalFilePickerBinder extends Binder {
  @override
  void bind() {
    ///[Source]
    getIt.registerFactory<LocalFilePickerSource>(
      () => LocalFilePickerSourceImp(),
    );

    ///[Usecases]
    getIt.registerFactory<PickLocalFileUsecase>(
      () => PickLocalFileUsecaseImp(
        source: getIt.get(),
      ),
    );
  }

  @override
  void dispose() {}
}

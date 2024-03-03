import 'package:get_it/get_it.dart';
import 'package:todo/modules/todos/todo_binder.dart';
import 'package:todo/services/device_info/onze_device_info_binder.dart';
import 'package:todo/services/file_picker/file_picker_binder.dart';
import 'package:todo/services/storage/storage_service_binder.dart';

final getIt = GetIt.instance;

abstract class Binder {
  void bind();
  void dispose();
}

class AppBinder {
  List<Binder> binders = [
    /// [Modules]
    TodoBinder(),

    /// [Services]
    LocalFilePickerBinder(),
    OnzeDeviceInfoBinder(),
    StorageServiceBinder(),
  ];

  setBinders() {
    for (final binder in binders) {
      binder.bind();
    }
  }

  disposeAll() async {
    await getIt.reset();
    setBinders();
    await getIt.allReady();
  }
}

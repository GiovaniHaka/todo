import 'package:get_it/get_it.dart';
import 'package:todo/modules/todos/todo_binder.dart';
import 'package:todo/services/device_info/onze_device_info_binder.dart';

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
    OnzeDeviceInfoBinder(),
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

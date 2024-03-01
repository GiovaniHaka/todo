import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

abstract class Binder {
  void bind();
  void dispose();
}

class AppBinder {
  List<Binder> binders = [];

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

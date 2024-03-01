import 'package:todo/core/binders/binder.dart';
import 'package:todo/services/device_info/onze_device_info_service.dart';

class OnzeDeviceInfoBinder implements Binder {
  @override
  void bind() {
    /// [Sources]
    getIt.registerSingleton<OnzeDeviceInfoService>(
      OnzeDeviceInfoService(),
    );
  }

  @override
  void dispose() {}
}

import 'package:todo/core/binders/binder.dart';
import 'package:todo/services/device_info/onze_device_info_service.dart';

/// Classe responsável por vincular a implementação do serviço de informações do dispositivo OnzeDeviceInfoService ao contêiner de injeção de dependência.
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

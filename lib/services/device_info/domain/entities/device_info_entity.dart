/// Classe que representa as informações de um dispositivo.
///
/// Construtor da classe [DeviceInfoEntity].
///
/// [deviceId] é o ID do dispositivo.
/// [deviceName] é o nome do dispositivo.
/// [deviceOs] é o sistema operacional do dispositivo.
/// [osVersion] é a versão do sistema operacional do dispositivo.
class DeviceInfoEntity {
  final String deviceId;
  final String deviceName;
  final String deviceOs;
  final String osVersion;

  DeviceInfoEntity({
    required this.deviceId,
    required this.deviceName,
    required this.deviceOs,
    required this.osVersion,
  });

  @override
  String toString() {
    return 'DeviceInfoEntity(deviceId: $deviceId, deviceName: $deviceName, deviceOs: $deviceOs, osVersion: $osVersion)';
  }
}

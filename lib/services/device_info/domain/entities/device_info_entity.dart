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

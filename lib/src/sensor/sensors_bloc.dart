import 'dart:async';

import 'package:hue_api/src/core/bridge.dart';
import 'package:hue_api/src/sensor/sensor.dart';

class SensorsBloc {
  final Bridge bridge;

  final StreamController<List<Sensor>> _sensors = StreamController();
  Stream<List<Sensor>> get sensors => _sensors.stream;

  SensorsBloc(this.bridge) {
    init();
  }

  void init() async {
    final currentSensors = await bridge.sensors();
    _sensors.add(currentSensors);
  }
}

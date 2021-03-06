import 'dart:async';

import 'package:hue_api/src/core/bridge.dart';
import 'package:hue_api/src/light/light.dart';

class LightsBloc {
  final Bridge bridge;

  final StreamController<List<Light>> _lights = StreamController();
  Stream<List<Light>> get lights => _lights.stream;

  LightsBloc(this.bridge) {
    init();
  }

  void init() async {
    final currentLights = await bridge.lights();
    _lights.add(currentLights);
  }
}

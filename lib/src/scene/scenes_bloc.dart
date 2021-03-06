import 'dart:async';

import 'package:hue_api/src/core/bridge.dart';
import 'package:hue_api/src/scene/scene.dart';

class ScenesBloc {
  final Bridge bridge;

  final StreamController<List<Scene>> _scenes = StreamController();
  Stream<List<Scene>> get scenes => _scenes.stream;

  ScenesBloc(this.bridge) {
    init();
  }

  void init() async {
    final currentScenes = await bridge.scenes();
    _scenes.add(currentScenes);
  }
}

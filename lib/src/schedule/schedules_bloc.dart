import 'dart:async';

import 'package:hue_api/src/core/bridge.dart';
import 'package:hue_api/src/schedule/schedule.dart';

class SchedulesBloc {
  final Bridge bridge;

  final StreamController<List<Schedule>> _schedules = StreamController();
  Stream<List<Schedule>> get schedules => _schedules.stream;

  SchedulesBloc(this.bridge) {
    init();
  }

  void init() async {
    final currentSchedules = await bridge.schedules();
    _schedules.add(currentSchedules);
  }
}

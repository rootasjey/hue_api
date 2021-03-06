import 'dart:async';

import 'package:hue_api/src/core/bridge.dart';
import 'package:hue_api/src/group/group.dart';

class GroupsBloc {
  final Bridge bridge;

  final StreamController<List<Group>> _groups = StreamController();
  Stream<List<Group>> get groups => _groups.stream;

  GroupsBloc(this.bridge) {
    init();
  }

  void init() async {
    final currentGroups = await bridge.groups();
    _groups.add(currentGroups);
  }
}

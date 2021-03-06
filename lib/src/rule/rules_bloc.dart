import 'dart:async';

import 'package:hue_api/src/core/bridge.dart';
import 'package:hue_api/src/rule/rule.dart';

class RulesBloc {
  final Bridge bridge;

  final StreamController<List<Rule>> _rules = StreamController();
  Stream<List<Rule>> get rules => _rules.stream;

  RulesBloc(this.bridge) {
    init();
  }

  void init() async {
    final currentRules = await bridge.rules();
    _rules.add(currentRules);
  }
}

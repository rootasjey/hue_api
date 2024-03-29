import 'dart:async' hide Timer;

import 'package:hue_api/src/core/bridge_client.dart';
import 'package:hue_api/src/core/bridge_response.dart';
import 'package:hue_api/src/schedule/schedule.dart';

class ScheduleApi {
  BridgeClient _client;
  String? _username;

  ScheduleApi(this._client, [this._username]);

  set username(String? username) => this._username = username;

  Future<List<Schedule>> all() async {
    String url = '/api/$_username/schedules';
    final response = await (_client.get(url) as FutureOr<Map<String, dynamic>>);
    return _responseToSchedules(response);
  }

  List<Schedule> _responseToSchedules(Map<String, dynamic> response) {
    final schedules = <Schedule>[];
    for (String id in response.keys) {
      Map<String, dynamic>? item = response[id];
      final schedule = Schedule.fromJson(item, id: id);
      schedules.add(schedule);
    }
    return schedules;
  }

  Future<Schedule> single(String id) async {
    String url = '/api/$_username/schedules/$id';
    final response = await _client.get(url);
    final schedule = Schedule.fromJson(response, id: id);
    return schedule;
  }

  Future<Schedule> create(Schedule schedule) async {
    String url = '/api/$_username/schedules';
    final response = await _client.post(
        url, schedule.toBridgeObject(action: 'create'), 'id');
    return schedule.rebuild((b) => b..id = response.key);
  }

  Future<BridgeResponse> attributes(Schedule schedule) async {
    String url = '/api/$_username/schedules/${schedule.id}';
    return await _client.put(
        url, schedule.toBridgeObject(action: 'attributes'));
  }

  Future<BridgeResponse> delete(Schedule schedule) async {
    String url = '/api/$_username/schedules/${schedule.id}';
    return await _client.delete(url);
  }
}

import 'dart:async';

import 'package:http/http.dart';
import 'package:hue_api/src/configuration/configuration.dart';
import 'package:hue_api/src/configuration/configuration_api.dart';
import 'package:hue_api/src/configuration/whitelist_item.dart';
import 'package:hue_api/src/core/bridge_client.dart';
import 'package:hue_api/src/core/bridge_response.dart';
import 'package:hue_api/src/group/group.dart';
import 'package:hue_api/src/group/group_api.dart';
import 'package:hue_api/src/light/light.dart';
import 'package:hue_api/src/light/light_api.dart';
import 'package:hue_api/src/resource_link/resource_link.dart';
import 'package:hue_api/src/resource_link/resource_link_api.dart';
import 'package:hue_api/src/rule/rule.dart';
import 'package:hue_api/src/rule/rule_api.dart';
import 'package:hue_api/src/scene/scene.dart';
import 'package:hue_api/src/scene/scene_api.dart';
import 'package:hue_api/src/schedule/schedule.dart';
import 'package:hue_api/src/schedule/schedule_api.dart';
import 'package:hue_api/src/sensor/sensor.dart';
import 'package:hue_api/src/sensor/sensor_api.dart';

/// a [Bridge] is used as a facade to the different api's
class Bridge {
  final ConfigurationApi _configurationApi;
  final GroupApi _groupApi;
  final LightApi _lightApi;
  final ResourceLinkApi _resourceLinkApi;
  final RuleApi _ruleApi;
  final SceneApi _sceneApi;
  final ScheduleApi _scheduleApi;
  final SensorApi _sensorApi;

  String? _username;

  /// create a bridge with a platform specific [client]. Setting the optional [username] enables the use of calls on the bridge that require a username
  Bridge(Client client, String? address, [String? username])
      : this._withApi(
            ConfigurationApi(BridgeClient(client, address)),
            GroupApi(BridgeClient(client, address)),
            LightApi(BridgeClient(client, address)),
            ResourceLinkApi(BridgeClient(client, address)),
            RuleApi(BridgeClient(client, address)),
            SceneApi(BridgeClient(client, address)),
            ScheduleApi(BridgeClient(client, address)),
            SensorApi(BridgeClient(client, address)),
            username);

  Bridge._withApi(
      this._configurationApi,
      this._groupApi,
      this._lightApi,
      this._resourceLinkApi,
      this._ruleApi,
      this._sceneApi,
      this._scheduleApi,
      this._sensorApi,
      [String? username]) {
    this.username = username;
  }

  /// set a username to enable the use of cclls on the bridge that require a username
  set username(String? username) {
    this._username = username;
    _groupApi.username = username;
    _lightApi.username = username;
    _resourceLinkApi.username = username;
    _ruleApi.username = username;
    _sceneApi.username = username;
    _scheduleApi.username = username;
    _sensorApi.username = username;
  }

  Future<Configuration> completeConfiguration() async =>
      await _configurationApi.completeConfiguration(_username);

  Future<Configuration> configuration() async =>
      await _configurationApi.configuration(_username);

  Future<WhiteListItem> createUser(String deviceType) async =>
      await _configurationApi.createUser(deviceType);

  Future<BridgeResponse> deleteUser(String deletingUsername) async =>
      await _configurationApi.deleteUser(_username, deletingUsername);

  /// update the bridge's configuration. Check the docs to see what can be changed
  Future<BridgeResponse> updateConfiguration(
          Configuration configuration) async =>
      await _configurationApi.update(_username, configuration);

  Future<List<Group>> groups() async => await _groupApi.all();

  Future<Group> group(int id) async => await _groupApi.single(id);

  Future<Group> createGroup(Group group) async => await _groupApi.create(group);

  /// change the name, class and/or lights of a [group].
  Future<BridgeResponse> updateGroupAttributes(Group group) async =>
      await _groupApi.attributes(group);

  /// update the color state of the lights in the [group]
  Future<BridgeResponse> updateGroupState(Group group) async =>
      await _groupApi.state(group);

  Future<BridgeResponse> deleteGroup(Group group) async =>
      await _groupApi.delete(group);

  Future<List<Light>> lights() async => await _lightApi.all();

  Future<Light> light(int id) async => await _lightApi.single(id);

  /// initiate a search for new lights. Optional serial numbers can be sent as [deviceIds].
  Future<BridgeResponse> searchLights(
          [List<String> deviceIds = const []]) async =>
      await _lightApi.search(deviceIds);

  /// return the lights found in the last search for new lights
  Future<List<Light>> lightSearchResults() async =>
      await _lightApi.searchResults();

  Future<BridgeResponse> renameLight(Light light) async =>
      await _lightApi.attributes(light);

  Future<BridgeResponse> updateLightState(Light light) async =>
      await _lightApi.state(light);

  Future<BridgeResponse> deleteLight(Light light) async =>
      await _lightApi.delete(light);

  Future<List<ResourceLink>> resourceLinks() async =>
      await _resourceLinkApi.all();

  Future<ResourceLink> resourceLink(String id) async =>
      await _resourceLinkApi.single(id);

  Future<ResourceLink> createResourceLink(ResourceLink resourceLink) async =>
      await _resourceLinkApi.create(resourceLink);

  Future<BridgeResponse> updateResourceLink(ResourceLink resourceLink) async =>
      await _resourceLinkApi.update(resourceLink);

  Future<BridgeResponse> deleteResourceLink(ResourceLink resourceLink) async =>
      await _resourceLinkApi.delete(resourceLink);

  Future<List<Rule>> rules() async => await _ruleApi.all();

  Future<Rule> rule(int id) async => await _ruleApi.single(id);

  Future<Rule> createRule(Rule rule) async => await _ruleApi.create(rule);

  Future<BridgeResponse> updateRule(Rule rule) async =>
      await _ruleApi.update(rule);

  Future<BridgeResponse> deleteRule(Rule rule) async =>
      await _ruleApi.delete(rule);

  Future<List<Scene>> scenes() async => await _sceneApi.all();

  Future<Scene> scene(String id) async => await _sceneApi.single(id);

  Future<BridgeResponse> updateSceneAttributes(Scene scene) async =>
      await _sceneApi.attributes(scene);

  Future<BridgeResponse> updateSceneLightState(
          Scene scene, Light light) async =>
      await _sceneApi.state(scene, light);

  Future<Scene> createScene(Scene scene) async => await _sceneApi.create(scene);

  Future<BridgeResponse> deleteScene(Scene scene) async =>
      await _sceneApi.delete(scene);

  Future<List<Schedule>> schedules() async => await _scheduleApi.all();

  Future<Schedule> schedule(String id) async => await _scheduleApi.single(id);

  Future<Schedule> createSchedule(Schedule schedule) async =>
      await _scheduleApi.create(schedule);

  Future<BridgeResponse> updateScheduleAttributes(Schedule schedule) async =>
      await _scheduleApi.attributes(schedule);

  Future<BridgeResponse> deleteSchedule(Schedule schedule) async =>
      await _scheduleApi.delete(schedule);

  Future<List<Sensor>> sensors() async => await _sensorApi.all();

  Future<Sensor> sensor(String id) async => await _sensorApi.single(id);

  Future<BridgeResponse> searchSensors() async => await _sensorApi.search();

  Future<List<Sensor>> sensorSearchResults() async =>
      await _sensorApi.searchResults();

  Future<Sensor> createSensor(Sensor sensor) async =>
      await _sensorApi.create(sensor);

  Future<BridgeResponse> updateSensorAttributes(Sensor sensor) async =>
      await _sensorApi.attributes(sensor);

  Future<BridgeResponse> updateSensorConfig(Sensor sensor) async =>
      await _sensorApi.config(sensor);

  Future<BridgeResponse> updateSensorState(Sensor sensor) async =>
      await _sensorApi.state(sensor);

  Future<BridgeResponse> deleteSensor(Sensor sensor) async =>
      await _sensorApi.delete(sensor);
}

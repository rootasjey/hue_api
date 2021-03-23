import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_api/src/configuration/auto_install.dart';
import 'package:hue_api/src/configuration/backup.dart';
import 'package:hue_api/src/configuration/configuration.dart';
import 'package:hue_api/src/configuration/internet_services.dart';
import 'package:hue_api/src/configuration/portal_state.dart';
import 'package:hue_api/src/configuration/software_update.dart';
import 'package:hue_api/src/configuration/software_update_bridge.dart';
import 'package:hue_api/src/configuration/whitelist_item.dart';
import 'package:hue_api/src/core/bridge_exception.dart';
import 'package:hue_api/src/core/discovery_result.dart';
import 'package:hue_api/src/core/hue_color.dart';
import 'package:hue_api/src/group/group_action.dart';
import 'package:hue_api/src/group/group.dart';
import 'package:hue_api/src/group/group_state.dart';
import 'package:hue_api/src/light/light.dart';
import 'package:hue_api/src/light/light_state.dart';
import 'package:hue_api/src/resource_link/resource_link.dart';
import 'package:hue_api/src/rule/condition.dart';
import 'package:hue_api/src/rule/rule.dart';
import 'package:hue_api/src/rule/rule_action.dart';
import 'package:hue_api/src/scene/app_data.dart';
import 'package:hue_api/src/scene/scene.dart';
import 'package:hue_api/src/schedule/command.dart';
import 'package:hue_api/src/schedule/schedule.dart';
import 'package:hue_api/src/sensor/sensor.dart';
import 'package:hue_api/src/sensor/sensor_capabilities.dart';
import 'package:hue_api/src/sensor/sensor_config.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:hue_api/src/sensor/sensor_state.dart';

part 'serializers.g.dart';

@SerializersFor([
  BridgeException,
  HueColor,
  ResourceLink,
  Rule,
  RuleAction,
  Condition,
  Sensor,
  SensorConfig,
  SensorState,
  Schedule,
  Command,
  Scene,
  AppData,
  GroupAction,
  GroupState,
  Group,
  LightState,
  DiscoveryResult,
  Light,
  Configuration,
  AutoInstall,
  BackUp,
  InternetServices,
  PortalState,
  SoftwareUpdate,
  SoftwareUpdateBridge,
  WhiteListItem,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

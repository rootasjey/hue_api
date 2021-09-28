import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../core/serializers.dart';

part 'sensor_capabilities.g.dart';

abstract class SensorCapabilities
  implements Built<SensorCapabilities, SensorCapabilitiesBuilder> {
  ///True if this sensor is certified.
  bool? get certified;

  ///True if this sensor is primary.
  bool? get primary;

  static Serializer<SensorCapabilities> get serializer => _$sensorCapabilitiesSerializer;

  SensorCapabilities._();

  factory SensorCapabilities([updates(SensorCapabilitiesBuilder b)]) = _$SensorCapabilities;

  factory SensorCapabilities.fromJson(Map json) {
    return serializers.deserializeWith(SensorCapabilities.serializer, json)!;
  }
}

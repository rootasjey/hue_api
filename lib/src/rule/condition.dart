import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_api/src/core/bridge_object.dart';

import 'package:hue_api/src/core/serializers.dart';

part 'condition.g.dart';

abstract class Condition
    with BridgeObject
    implements Built<Condition, ConditionBuilder> {
  String? get address;

  String? get operator;

  String? get value;

  static Serializer<Condition> get serializer => _$conditionSerializer;

  Condition._();

  factory Condition([updates(ConditionBuilder b)]) = _$Condition;

  factory Condition.fromJson(Map json) {
    return serializers.deserializeWith(serializer, json)!;
  }

  @override
  Map? toBridgeObject({String? action}) {
    return serializers.serializeWith(serializer, this) as Map<dynamic, dynamic>?;
  }
}

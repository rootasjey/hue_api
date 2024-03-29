import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_api/src/core/serializers.dart';

part 'bridge_exception.g.dart';

abstract class BridgeException
    implements Built<BridgeException, BridgeExceptionBuilder> {
  String? get address;

  String? get description;

  int? get type;

  static Serializer<BridgeException> get serializer =>
      _$bridgeExceptionSerializer;

  BridgeException._();

  factory BridgeException([updates(BridgeExceptionBuilder b)]) =
      _$BridgeException;

  factory BridgeException.fromJson(Map? json) {
    return serializers.deserializeWith(BridgeException.serializer, json)!;
  }
}

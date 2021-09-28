// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_capabilities.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SensorCapabilities> _$sensorCapabilitiesSerializer =
    new _$SensorCapabilitiesSerializer();

class _$SensorCapabilitiesSerializer
    implements StructuredSerializer<SensorCapabilities> {
  @override
  final Iterable<Type> types = const [SensorCapabilities, _$SensorCapabilities];
  @override
  final String wireName = 'SensorCapabilities';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SensorCapabilities object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.certified;
    if (value != null) {
      result
        ..add('certified')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.primary;
    if (value != null) {
      result
        ..add('primary')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  SensorCapabilities deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SensorCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'certified':
          result.certified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'primary':
          result.primary = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$SensorCapabilities extends SensorCapabilities {
  @override
  final bool? certified;
  @override
  final bool? primary;

  factory _$SensorCapabilities(
          [void Function(SensorCapabilitiesBuilder)? updates]) =>
      (new SensorCapabilitiesBuilder()..update(updates)).build();

  _$SensorCapabilities._({this.certified, this.primary}) : super._();

  @override
  SensorCapabilities rebuild(
          void Function(SensorCapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SensorCapabilitiesBuilder toBuilder() =>
      new SensorCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SensorCapabilities &&
        certified == other.certified &&
        primary == other.primary;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, certified.hashCode), primary.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SensorCapabilities')
          ..add('certified', certified)
          ..add('primary', primary))
        .toString();
  }
}

class SensorCapabilitiesBuilder
    implements Builder<SensorCapabilities, SensorCapabilitiesBuilder> {
  _$SensorCapabilities? _$v;

  bool? _certified;
  bool? get certified => _$this._certified;
  set certified(bool? certified) => _$this._certified = certified;

  bool? _primary;
  bool? get primary => _$this._primary;
  set primary(bool? primary) => _$this._primary = primary;

  SensorCapabilitiesBuilder();

  SensorCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _certified = $v.certified;
      _primary = $v.primary;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SensorCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SensorCapabilities;
  }

  @override
  void update(void Function(SensorCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SensorCapabilities build() {
    final _$result = _$v ??
        new _$SensorCapabilities._(certified: certified, primary: primary);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
